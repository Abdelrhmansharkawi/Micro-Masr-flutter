import '../../../../core/network/dio_client.dart';
import 'package:flutter/material.dart';

class PaymentMethodModel {
  final String id;
  final String type; // 'card', 'fawry', 'vodafone'
  final String? cardNumberLast4;
  final String? cardBrand;
  final int? expiryMonth;
  final int? expiryYear;
  final String? cardHolderName;
  final String? phoneNumber;
  final bool isDefault;

  PaymentMethodModel({
    required this.id,
    required this.type,
    this.cardNumberLast4,
    this.cardBrand,
    this.expiryMonth,
    this.expiryYear,
    this.cardHolderName,
    this.phoneNumber,
    required this.isDefault,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['_id'],
      type: json['type'],
      cardNumberLast4: json['cardNumberLast4'],
      cardBrand: json['cardBrand'],
      expiryMonth: json['expiryMonth'],
      expiryYear: json['expiryYear'],
      cardHolderName: json['cardHolderName'],
      phoneNumber: json['phoneNumber'],
      isDefault: json['isDefault'] ?? false,
    );
  }

  String get displayName {
    if (type == 'card') {
      return '$cardBrand •••• $cardNumberLast4';
    } else if (type == 'vodafone') {
      return 'Vodafone Cash';
    } else {
      return 'Fawry';
    }
  }

  String get displaySubtitle {
    if (type == 'card') {
      return 'تنتهي في $expiryMonth/$expiryYear';
    } else if (type == 'vodafone') {
      return phoneNumber ?? '';
    } else {
      return phoneNumber ?? '';
    }
  }

  IconData get icon {
    if (type == 'card') return Icons.credit_card;
    if (type == 'vodafone') return Icons.phone_android;
    return Icons.account_balance_wallet;
  }
}

class PaymentMethodService {
  final dio = DioClient.dio;

  Future<List<PaymentMethodModel>> getMyMethods() async {
    final res = await dio.get('/payment-methods');
    final List data = res.data['data'];
    return data.map((json) => PaymentMethodModel.fromJson(json)).toList();
  }

  Future<PaymentMethodModel> addCard({
    required String cardNumber,
    required int expiryMonth,
    required int expiryYear,
    required String cardHolderName,
    required String cardBrand,
    bool isDefault = false,
  }) async {
    final res = await dio.post('/payment-methods/card', data: {
      'cardNumber': cardNumber,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
      'cardHolderName': cardHolderName,
      'cardBrand': cardBrand,
      'isDefault': isDefault,
    });
    return PaymentMethodModel.fromJson(res.data['data']);
  }

  Future<PaymentMethodModel> addWallet({
    required String type, // 'fawry' or 'vodafone'
    required String phoneNumber,
    bool isDefault = false,
  }) async {
    final res = await dio.post('/payment-methods/wallet', data: {
      'type': type,
      'phoneNumber': phoneNumber,
      'isDefault': isDefault,
    });
    return PaymentMethodModel.fromJson(res.data['data']);
  }

  Future<void> deleteMethod(String id) async {
    await dio.delete('/payment-methods/$id');
  }

  Future<void> setDefault(String id) async {
    await dio.patch('/payment-methods/$id/default');
  }
}
