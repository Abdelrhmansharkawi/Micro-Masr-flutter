import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/profile_payment_card.dart';
import 'package:micromasr/features/passenger/data/services/booking_service.dart';
import 'package:micromasr/features/passenger/data/services/payment_method_service.dart';

class PaymentMethodsScreen extends StatefulWidget {
  final String? bookingId;
  final int? amount;

  const PaymentMethodsScreen({
    super.key,
    this.bookingId,
    this.amount,
  });

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final PaymentMethodService _methodService = PaymentMethodService();
  final BookingService _bookingService = BookingService();
  List<PaymentMethodModel> _methods = [];
  bool _isLoading = true;
  String? _selectedMethodId;
  bool _isPaying = false;

  @override
  void initState() {
    super.initState();
    _loadMethods();
  }

  Future<void> _loadMethods() async {
    setState(() => _isLoading = true);
    try {
      final methods = await _methodService.getMyMethods();
      setState(() {
        _methods = methods;
        PaymentMethodModel? defaultMethod;
        try {
          defaultMethod = methods.firstWhere((m) => m.isDefault);
        } catch (_) {
          if (methods.isNotEmpty) defaultMethod = methods.first;
        }
        _selectedMethodId = defaultMethod?.id;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل تحميل طرق الدفع: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _pay() async {
    if (widget.bookingId == null || _selectedMethodId == null) return;
    setState(() => _isPaying = true);
    try {
      final result = await _bookingService.payForBooking(
        bookingId: widget.bookingId!,
        paymentMethodId: _selectedMethodId!,
      );
      if (mounted) {
        context.pushReplacement(
          AppRouteConstants.passengerPaymentSuccess,
          extra: result['booking'],
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل الدفع: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isPaying = false);
    }
  }

  void _showAddMethodDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            String methodType = 'card';
            final cardNumberController = TextEditingController();
            final expiryController = TextEditingController();
            final cardHolderController = TextEditingController();
            final phoneController = TextEditingController();
            bool isDefault = false;
            bool isSaving = false;

            Future<void> save() async {
              setModalState(() => isSaving = true);
              try {
                if (methodType == 'card') {
                  final parts = expiryController.text.split('/');
                  final month = int.parse(parts[0]);
                  final year = int.parse(parts[1]);
                  await _methodService.addCard(
                    cardNumber: cardNumberController.text.trim(),
                    expiryMonth: month,
                    expiryYear: year,
                    cardHolderName: cardHolderController.text.trim(),
                    cardBrand: 'بطاقة',
                    isDefault: isDefault,
                  );
                } else {
                  await _methodService.addWallet(
                    type: methodType,
                    phoneNumber: phoneController.text.trim(),
                    isDefault: isDefault,
                  );
                }
                Navigator.pop(context);
                _loadMethods();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('فشل الحفظ: $e')),
                );
              } finally {
                setModalState(() => isSaving = false);
              }
            }

            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('إضافة وسيلة دفع جديدة',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: methodType,
                      items: const [
                        DropdownMenuItem(
                            value: 'card', child: Text('بطاقة ائتمان')),
                        DropdownMenuItem(
                            value: 'vodafone', child: Text('فودافون كاش')),
                        DropdownMenuItem(value: 'fawry', child: Text('فوري')),
                      ],
                      onChanged: (v) => setModalState(() => methodType = v!),
                      decoration:
                          const InputDecoration(labelText: 'نوع الوسيلة'),
                    ),
                    const SizedBox(height: 16),
                    if (methodType == 'card') ...[
                      TextField(
                          controller: cardNumberController,
                          decoration:
                              const InputDecoration(labelText: 'رقم البطاقة'),
                          keyboardType: TextInputType.number),
                      const SizedBox(height: 8),
                      TextField(
                          controller: expiryController,
                          decoration: const InputDecoration(
                              labelText: 'تاريخ الانتهاء (MM/YY)'),
                          keyboardType: TextInputType.datetime),
                      const SizedBox(height: 8),
                      TextField(
                          controller: cardHolderController,
                          decoration: const InputDecoration(
                              labelText: 'اسم حامل البطاقة')),
                    ] else ...[
                      TextField(
                          controller: phoneController,
                          decoration:
                              const InputDecoration(labelText: 'رقم الهاتف'),
                          keyboardType: TextInputType.phone),
                    ],
                    const SizedBox(height: 16),
                    Row(children: [
                      Checkbox(
                          value: isDefault,
                          onChanged: (v) =>
                              setModalState(() => isDefault = v!)),
                      const Text('تعيين كوسيلة دفع افتراضية'),
                    ]),
                    const SizedBox(height: 16),
                    AppButton(
                      label: isSaving ? 'جاري الحفظ...' : 'حفظ',
                      onPressed: () {
                        if (!isSaving) save();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'طرق الدفع'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(20.aw),
              child: Column(
                children: [
                  Expanded(
                    child: _methods.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.credit_card_off,
                                    size: 64, color: Colors.grey),
                                const SizedBox(height: 16),
                                Text('لا توجد طرق دفع محفوظة',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: _methods.length,
                            itemBuilder: (ctx, index) {
                              final method = _methods[index];
                              return ProfilePaymentCard(
                                label: method.displayName,
                                subtitle: method.displaySubtitle,
                                icon: method.icon,
                                isSelected: _selectedMethodId == method.id,
                                onTap: _isPaying
                                    ? () {}
                                    : () => setState(
                                        () => _selectedMethodId = method.id),
                              );
                            },
                          ),
                  ),
                  AppButton(
                    label: 'إضافة بطاقة جديدة',
                    icon: Icons.add_circle_outline_rounded,
                    onPressed: () {
                      if (!_isPaying) _showAddMethodDialog();
                    },
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    label: _isPaying ? 'جاري الدفع...' : 'تأكيد الدفع',
                    onPressed: () {
                      if (!_isPaying && _selectedMethodId != null) _pay();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}