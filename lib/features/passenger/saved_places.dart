import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'data/models/saved_place_model.dart';
import 'data/services/saved_places_service.dart';

class SavedPlaces extends StatefulWidget {
  const SavedPlaces({super.key});

  @override
  State<SavedPlaces> createState() => _SavedPlacesState();
}

class _SavedPlacesState extends State<SavedPlaces> {
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
    try {
      final places = await _service.getMyPlaces();
      if (mounted) {
        setState(() {
          _places = places;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'تعذر تحميل الأماكن';
          _loading = false;
        });
      }
    }
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'home':
        return Icons.home;
      case 'work':
        return Icons.business_center;
      default:
        return Icons.place;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                width: 4.aw, height: 20.ah, color: context.colors.primary),
            const HorizontalSpace(8),
            Text(
              AppStrings.savedPlacesTitle,
              style: context.headlineMediumTextStyle.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const VerticalSpace(16),
        if (_loading)
          const Center(child: CircularProgressIndicator())
        else if (_error != null)
          Text(_error!, style: const TextStyle(color: Colors.red))
        else if (_places.isEmpty)
          Text('لا توجد أماكن محفوظة', style: context.bodyMediumTextStyle)
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _places
                  .map((place) => _buildPlaceCard(context, place))
                  .toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildPlaceCard(BuildContext context, SavedPlaceModel place) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () {
          context.go(AppRouteConstants.passengerRides);
        },
        child: Container(
          width: 120.aw,
          padding: EdgeInsets.symmetric(vertical: 20.ah, horizontal: 8.aw),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.colors.background,
                  shape: BoxShape.circle,
                ),
                child: Icon(_iconForType(place.type),
                    color: const Color(0xFFF09063)),
              ),
              const VerticalSpace(12),
              Text(
                place.name,
                style: context.titleMediumTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
