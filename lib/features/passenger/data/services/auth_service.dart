import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';

class AuthService {
  final dio = DioClient.dio;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: {
          "fullName": fullName,
          "email": email,
          "password": password,
          "phone": phone,
          "role": "user",
        },
      );

      if (response.statusCode == 201 && response.data['status'] == 'success') {
        return response.data;
      } else {
        throw Exception(response.data['message'] ?? 'Register failed');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
