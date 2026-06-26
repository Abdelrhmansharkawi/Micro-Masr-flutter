import '../../../../core/network/dio_client.dart';

class PaymentService {
  final dio = DioClient.dio;

  /// Initiate Paymob payment
  Future<Map<String, dynamic>> initiatePaymobPayment({
    required String bookingId,
    required String integrationId,
  }) async {
    final response = await dio.post(
      '/payments/initiate-paymob',
      data: {
        'bookingId': bookingId,
        'integrationId': integrationId,
      },
    );
    return response
        .data['data']; // { paymentToken, orderId, integrationId, iframeId }
  }

  /// Check payment status
  Future<String> getPaymentStatus(String bookingId) async {
    final response = await dio.get('/payments/status/$bookingId');
    return response.data['data']['paymentStatus'];
  }
}
