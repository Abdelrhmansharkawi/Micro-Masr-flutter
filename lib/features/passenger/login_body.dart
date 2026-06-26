import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/auth_divider.dart';
import 'package:micromasr/features/passenger/social_sign_in_button.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(24.aw),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(24.aw),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.signInTitle,
                style: context.headlineMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary,
                ),
              ),
              const VerticalSpace(24),
              const LoginForm(),
              const VerticalSpace(32),
              const PassengerAuthDivider(text: 'أو'),
              const VerticalSpace(24),
              SocialSignInButton(
                label: AppStrings.continueWithGoogle,
                onPressed: () {},
              ),
            ],
          ),
        ),
        const VerticalSpace(24),
        _buildSkipButton(context),
        const VerticalSpace(32),
        _buildSignUpLink(context),
      ],
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(AppRouteConstants.passengerHome),
      child: Text(
        AppStrings.skipAndGuest,
        style: context.bodyLargeTextStyle.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAccount,
          style: context.bodyLargeTextStyle.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () => context.push(AppRouteConstants.passengerRegister),
          child: Text(
            AppStrings.signUp,
            style: context.bodyLargeTextStyle.copyWith(
              color: const Color(0xFFF09063),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}











