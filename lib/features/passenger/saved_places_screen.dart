import 'package:flutter/material.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/saved_place_item.dart';
import 'package:micromasr/core/app_button.dart';
import 'data/models/saved_place_model.dart';
import 'data/services/saved_places_service.dart';

class SavedPlacesScreen extends StatefulWidget {
  const SavedPlacesScreen({super.key});

  @override
  State<SavedPlacesScreen> createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
  final SavedPlacesService _service = SavedPlacesService();
  List<SavedPlaceModel> _places = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  Future<void> _fetchPlaces() async {
    setState(() => _loading = true);
    try {
      final places = await _service.getMyPlaces();
      setState(() {
        _places = places;
        _loading = false;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = 'فشل تحميل الأماكن المحفوظة';
        _loading = false;
      });
    }
  }

  Future<void> _deletePlace(SavedPlaceModel place) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('حذف المكان'),
        content: Text('هل أنت متأكد من حذف "${place.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await _service.deletePlace(place.id);
      _fetchPlaces();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حذف المكان بنجاح')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فشل حذف المكان')),
      );
    }
  }

  void _showAddPlaceDialog() {
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final latController = TextEditingController();
    final lngController = TextEditingController();
    String selectedType = 'other';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('إضافة مكان جديد'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'اسم المكان *'),
                textDirection: TextDirection.rtl,
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'العنوان'),
                textDirection: TextDirection.rtl,
              ),
              TextField(
                controller: latController,
                decoration: const InputDecoration(labelText: 'خط العرض *'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: lngController,
                decoration: const InputDecoration(labelText: 'خط الطول *'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedType,
                items: const [
                  DropdownMenuItem(value: 'home', child: Text('منزل')),
                  DropdownMenuItem(value: 'work', child: Text('عمل')),
                  DropdownMenuItem(value: 'other', child: Text('أخرى')),
                ],
                onChanged: (val) => selectedType = val!,
                decoration: const InputDecoration(labelText: 'النوع'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final lat = double.tryParse(latController.text.trim());
              final lng = double.tryParse(lngController.text.trim());
              if (name.isEmpty || lat == null || lng == null) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(content: Text('يرجى ملء البيانات الأساسية')),
                );
                return;
              }
              Navigator.pop(ctx);
              try {
                await _service.addPlace(
                  name: name,
                  address: addressController.text.trim(),
                  latitude: lat,
                  longitude: lng,
                  type: selectedType,
                );
                _fetchPlaces();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم إضافة المكان بنجاح')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('فشل إضافة المكان')),
                );
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'home':
        return Icons.home_rounded;
      case 'work':
        return Icons.work_rounded;
      default:
        return Icons.place_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'الأماكن المحفوظة'),
      body: Padding(
        padding: EdgeInsets.all(20.aw),
        child: Column(
          children: [
            if (_loading)
              const Center(child: CircularProgressIndicator())
            else if (_error != null)
              Column(
                children: [
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                  const VerticalSpace(16),
                  AppButton(
                    label: 'إعادة المحاولة',
                    onPressed: _fetchPlaces,
                  ),
                ],
              )
            else if (_places.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'لا توجد أماكن محفوظة',
                    style: textTheme.bodyMedium,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _places.length,
                  itemBuilder: (ctx, index) {
                    final place = _places[index];
                    return SavedPlaceItem(
                      icon: _iconForType(place.type),
                      label: place.name,
                      address: place.address ?? 'بدون عنوان',
                      onDelete: () => _deletePlace(place),
                    );
                  },
                ),
              ),
            const VerticalSpace(16),
            AppButton(
              label: 'إضافة مكان جديد',
              icon: Icons.add_circle_outline_rounded,
              onPressed: _showAddPlaceDialog,
            ),
          ],
        ),
      ),
    );
  }
}
