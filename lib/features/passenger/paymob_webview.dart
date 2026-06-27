import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/features/passenger/data/services/payment_service.dart';

class PaymobWebView extends StatefulWidget {
  final String paymentToken;
  final String iframeId;
  final String bookingId;
  final Map<String, dynamic> bookingData; 

  const PaymobWebView({
    super.key,
    required this.paymentToken,
    required this.iframeId,
    required this.bookingId,
    required this.bookingData,
  });

  @override
  State<PaymobWebView> createState() => _PaymobWebViewState();
}

class _PaymobWebViewState extends State<PaymobWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _paymentCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => _isLoading = true);
          },
          onPageFinished: (url) {
            setState(() => _isLoading = false);
          },
          onWebResourceError: (error) {
            print('WebView error: $error');
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://accept.paymobsolutions.com/api/acceptance/iframes/${widget.iframeId}?payment_token=${widget.paymentToken}',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدفع'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _handleClose(),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _handleClose() async {
    if (_paymentCompleted) {
      context.pop();
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF9CCC65), 
        ),
      ),
    );

    final paymentService = PaymentService();
    String status = 'pending';

    for (int i = 0; i < 4; i++) {
      status = await paymentService.getPaymentStatus(widget.bookingId);

      if (status == 'paid') {
        break;
      }

      await Future.delayed(const Duration(milliseconds: 1500));
    }

    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    if (status == 'paid') {
      _paymentCompleted = true;
      if (mounted) {
        context.pushReplacement(
          AppRouteConstants.passengerPaymentSuccess,
          extra: widget.bookingData,
        );
      }
    } else {
      _showPaymentStatusDialog(status);
    }
  }

  void _showPaymentStatusDialog(String status) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(status == 'pending' ? 'جاري معالجة الدفع' : 'فشل الدفع'),
        content: Text(status == 'pending'
            ? 'سيتم تأكيد الحجز خلال لحظات'
            : 'حدث خطأ أثناء الدفع، يرجى المحاولة مرة أخرى'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.pop(); 
            },
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }
}
