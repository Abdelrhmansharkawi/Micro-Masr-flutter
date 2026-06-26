import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

class UserService {
  final dio = DioClient.dio;

  Future<UserModel> getMe() async {
    final res = await dio.get('/auth/me');
    return UserModel.fromJson(res.data['data']);
  }

  Future<UserModel> updateProfile({
    String? fullName,
    String? phone,
    String? email,
    String? profileImage,
  }) async {
    final Map<String, dynamic> data = {};
    if (fullName != null) data['fullName'] = fullName;
    if (phone != null) data['phone'] = phone;
    if (email != null) data['email'] = email;
    if (profileImage != null) data['profileImage'] = profileImage;

    final res = await dio.patch('/auth/update-me', data: data);
    final updatedUser = res.data['data']['user'];
    return UserModel.fromJson(
        {'user': updatedUser, 'unreadNotificationCount': 0, 'tripsCount': 0});
  }

  // Change password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await dio.patch('/auth/change-password', data: {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    });
  }
}
