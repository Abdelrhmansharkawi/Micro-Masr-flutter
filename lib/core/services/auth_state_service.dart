import 'package:micromasr/core/services/storage_service.dart';

class AuthStateService {
  static Future<bool> isLoggedIn() async {
    final token = await StorageService.getToken();
    return token != null && token.isNotEmpty;
  }

  static Future<void> logout() async {
    await StorageService.clearAll();
  }
}
