import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/auth_app_bar.dart';
import 'package:micromasr/features/passenger/otp_input_field.dart';
import 'otp_header.dart';
import 'otp_illustration.dart';
import 'otp_timer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otpCode = '';
  bool _isLoading = false;

  Future<void> _handleVerify() async {
    if (_otpCode.length == 6) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        context.go(AppRouteConstants.passengerHome);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: const PassengerAuthAppBar(title: AppStrings.confirmPhoneNumber),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const OtpHeader(),
              const VerticalSpace(60),
              const OtpIllustration(),
              const VerticalSpace(60),
              OtpInputField(
                length: 6,
                onCompleted: (code) => setState(() => _otpCode = code),
              ),
              const VerticalSpace(40),
              OtpTimer(onResend: () {
                // Dummy resend
              }),
              const Spacer(),
              AppButton(
                label: AppStrings.confirm,
                isLoading: _isLoading,
                isDisabled: _otpCode.length < 6,
                onPressed: _handleVerify,
              ),
              const VerticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}












