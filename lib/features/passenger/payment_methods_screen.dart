import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/payment_config.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/profile_payment_card.dart';
import 'package:micromasr/features/passenger/data/services/payment_method_service.dart';
import 'package:micromasr/features/passenger/data/services/payment_service.dart';
import 'package:micromasr/features/passenger/paymob_webview.dart';

class PaymentMethodsScreen extends StatefulWidget {
  final String? bookingId;
  final int? amount;
  final Map<String, dynamic>? bookingData;

  const PaymentMethodsScreen({
    super.key,
    this.bookingId,
    this.amount,
    this.bookingData,
  });

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final PaymentMethodService _methodService = PaymentMethodService();
  final PaymentService _paymentService = PaymentService();
  List<PaymentMethodModel> _methods = [];
  bool _isLoading = true;
  String? _selectedMethodId;
  String? _selectedMethodType;
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
        _selectedMethodType = defaultMethod?.type;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل تحميل طرق الدفع: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String _getIntegrationIdForType(String type) {
    switch (type) {
      case 'card':
        return PaymentConfig.cardIntegrationId;
      case 'vodafone':
      case 'fawry':
        return PaymentConfig.walletIntegrationId;
      default:
        return PaymentConfig.cardIntegrationId;
    }
  }

  Future<void> _payWithPaymob() async {
    if (widget.bookingId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('خطأ: رقم الحجز غير موجود')),
      );
      return;
    }

    // إذا لم يقم المستخدم باختيار وسيلة معينة، يتم الدفع افتراضياً عبر البطاقة 'card' مباشرة
    final currentMethodType = _selectedMethodType ?? 'card';
    final integrationId = _getIntegrationIdForType(currentMethodType);

    if (integrationId == 'YOUR_WALLET_INTEGRATION_ID' &&
        (currentMethodType == 'vodafone' || currentMethodType == 'fawry')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إعداد معرف الدفع للمحفظة')),
      );
      return;
    }

    setState(() => _isPaying = true);
    try {
      final result = await _paymentService.initiatePaymobPayment(
        bookingId: widget.bookingId!,
        integrationId: integrationId,
      );

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PaymobWebView(
              paymentToken: result['paymentToken'],
              iframeId: result['iframeId'],
              bookingId: widget.bookingId!,
              bookingData: widget.bookingData ?? {},
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل بدء الدفع: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isPaying = false);
    }
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
                                    : () => setState(() {
                                          _selectedMethodId = method.id;
                                          _selectedMethodType = method.type;
                                        }),
                              );
                            },
                          ),
                  ),
                  // تم حذف زر "إضافة بطاقة جديدة" بناءً على طلبك
                  const SizedBox(height: 16),
                  AppButton(
                    label: _isPaying ? 'جاري الدفع...' : 'اذهب للدفع الآن',
                    onPressed: () {
                      if (!_isPaying) {
                        _payWithPaymob();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
