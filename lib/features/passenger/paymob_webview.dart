import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/features/passenger/data/services/payment_service.dart';

class PaymobWebView extends StatefulWidget {
  final String paymentToken;
  final String iframeId;
  final String bookingId;
  final Map<String, dynamic> bookingData; // to pass to success screen

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
            // If the iframe redirects to a success page, we can trigger polling
            // or just wait for the user to close the webview.
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
    // When user closes the webview, check payment status
    if (!_paymentCompleted) {
      final paymentService = PaymentService();
      final status = await paymentService.getPaymentStatus(widget.bookingId);
      if (status == 'paid') {
        _paymentCompleted = true;
        if (mounted) {
          context.pushReplacement(
            AppRouteConstants.passengerPaymentSuccess,
            extra: widget.bookingData,
          );
        }
      } else {
        // Still pending or failed – show a dialog
        _showPaymentStatusDialog(status);
      }
    } else {
      context.pop();
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
              context.pop(); // go back to previous screen
            },
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }
}
