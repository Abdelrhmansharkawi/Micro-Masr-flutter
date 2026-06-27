import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_text_field.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/data/services/user_service.dart';
import 'package:micromasr/features/passenger/data/models/user_model.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final UserService _userService = UserService();
  late Future<UserModel> _userFuture;

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool _isSaving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _userFuture = _loadUser();
  }

  Future<UserModel> _loadUser() async {
    try {
      final user = await _userService.getMe();
      _fullNameController.text = user.fullName;
      _phoneController.text = user.phone;
      _emailController.text = user.email;
      return user;
    } catch (e) {
      setState(() => _error = 'Failed to load user data');
      rethrow;
    }
  }

  Future<void> _saveProfile() async {
    setState(() => _isSaving = true);
    try {
      await _userService.updateProfile(
        fullName: _fullNameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
      );

      if (_currentPasswordController.text.isNotEmpty &&
          _newPasswordController.text.isNotEmpty) {
        await _userService.changePassword(
          currentPassword: _currentPasswordController.text,
          newPassword: _newPasswordController.text,
        );

        _currentPasswordController.clear();
        _newPasswordController.clear();
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم تحديث الملف الشخصي بنجاح')),
        );
        context.go(AppRouteConstants.passengerProfile);
      }
    } catch (e) {
      if (mounted) {
        String errorMessage = 'حدث خطأ غير متوقع';
        final errorStr = e.toString();

        if (errorStr.contains('Current password is incorrect')) {
          errorMessage = '⚠️ كلمة المرور الحالية غير صحيحة';
        } else if (errorStr.contains('duplicate key') ||
            errorStr.contains('email already exists')) {
          errorMessage = '⚠️ البريد الإلكتروني مستخدم بالفعل';
        } else if (errorStr.contains('Network error')) {
          errorMessage = '⚠️ خطأ في الشبكة، يرجى المحاولة لاحقاً';
        } else if (errorStr.contains('password')) {
          errorMessage = '⚠️ كلمة المرور الجديدة يجب أن تكون 6 أحرف على الأقل';
        } else {
          errorMessage = errorStr.replaceAll('Exception:', '').trim();
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red.shade700,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'المعلومات الشخصية'),
      body: FutureBuilder<UserModel>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final user = snapshot.data!;
          return SingleChildScrollView(
            padding: EdgeInsets.all(20.aw),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 100.aw,
                        height: 100.aw,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB5D1B9),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            user.firstName.isNotEmpty ? user.firstName[0] : '?',
                            style: context.headlineLargeTextStyle.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        bottom: 0,
                        start: 0,
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: context.colors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.camera_alt_rounded,
                                color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(32),

                AppTextField(
                  label: 'الاسم الكامل',
                  controller: _fullNameController,
                  prefixIcon:
                      Icon(Icons.person_outline, color: context.colors.primary),
                ),
                const VerticalSpace(16),
                AppTextField(
                  label: 'رقم الهاتف',
                  controller: _phoneController,
                  prefixIcon: Icon(Icons.phone_android_outlined,
                      color: context.colors.primary),
                  keyboardType: TextInputType.phone,
                ),
                const VerticalSpace(16),
                AppTextField(
                  label: 'البريد الإلكتروني',
                  controller: _emailController,
                  prefixIcon:
                      Icon(Icons.email_outlined, color: context.colors.primary),
                  keyboardType: TextInputType.emailAddress,
                ),

                const VerticalSpace(32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تغيير كلمة المرور',
                      style: context.titleSmallTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.lock_outline,
                        color: context.colors.primary, size: 20),
                  ],
                ),
                const VerticalSpace(16),
                AppTextField(
                  label: 'كلمة المرور الحالية',
                  controller: _currentPasswordController,
                  obscureText: true,
                ),
                const VerticalSpace(12),
                AppTextField(
                  label: 'كلمة المرور الجديدة',
                  controller: _newPasswordController,
                  obscureText: true,
                ),

                const VerticalSpace(40),
                AppButton(
                  label: _isSaving ? 'جاري الحفظ...' : 'حفظ التغييرات',
                  onPressed: () {
                    if (!_isSaving) {
                      _saveProfile();
                    }
                  },
                ),
                const VerticalSpace(40),
              ],
            ),
          );
        },
      ),
    );
  }
}
