import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/core/services/auth_state_service.dart';
import 'package:micromasr/features/passenger/data/services/user_service.dart';
import 'package:micromasr/features/passenger/data/models/user_model.dart';
import 'profile_header.dart';
import 'profile_stats_row.dart';
import 'account_section.dart';
import 'preferences_section.dart';
import 'support_section.dart';
import 'logout_button.dart';

class PassengerProfileScreen extends StatefulWidget {
  const PassengerProfileScreen({super.key});

  @override
  State<PassengerProfileScreen> createState() => _PassengerProfileScreenState();
}

class _PassengerProfileScreenState extends State<PassengerProfileScreen> {
  final UserService _userService = UserService();

  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  UserModel? _user;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final user = await _userService.getMe();
      if (mounted) {
        setState(() {
          _user = user;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF2EFE8),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null || _user == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF2EFE8),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _error ?? 'تعذر تحميل البيانات',
                style: context.bodyLargeTextStyle,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadProfile,
                child: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        ),
      );
    }

    final user = _user!;

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              name: user.fullName,
              phone: user.phone,
              avatarInitial: user.initial,
              isVerified: user.isVerified,
            ),
            Transform.translate(
              offset: Offset(0, -30.ah),
              child: ProfileStatsRow(
                trips: user.tripsCount,
                rating: user.rating,
                balance: user.balance,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.aw),
              child: Column(
                children: [
                  const AccountSection(),
                  const VerticalSpace(24),
                  PreferencesSection(
                    isDarkMode: _isDarkMode,
                    notificationsEnabled: _notificationsEnabled,
                    onDarkModeToggle: (v) => setState(() => _isDarkMode = v),
                    onNotificationsToggle: (v) =>
                        setState(() => _notificationsEnabled = v),
                  ),
                  const VerticalSpace(24),
                  const SupportSection(),
                  const VerticalSpace(32),
                  LogoutButton(
                    onTap: () async {
                      await AuthStateService.logout();
                      if (mounted) {
                        context.go(AppRouteConstants.passengerLogin);
                      }
                    },
                  ),
                  const VerticalSpace(16),
                  Text(
                    'Micro Masr v1.0.0',
                    style: context.bodySmallTextStyle.copyWith(
                      color: context.colors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSpace(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
