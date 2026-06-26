import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/auth_divider.dart';
import 'package:micromasr/features/passenger/social_sign_in_button.dart';
import 'register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.signUpTitle,
          style: context.headlineLargeTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
        ),
        const VerticalSpace(8),
        Text(
          AppStrings.signUpSubtitle,
          style: context.bodyLargeTextStyle.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const VerticalSpace(32),
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
          child: const RegisterForm(),
        ),
        const VerticalSpace(24),
        const PassengerAuthDivider(text: 'أو'),
        const VerticalSpace(24),
        SocialSignInButton(
          label: AppStrings.continueWithGoogle,
          onPressed: () {},
        ),
        const VerticalSpace(32),
        _buildLoginLink(context),
        const VerticalSpace(32),
      ],
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount,
          style: context.bodyLargeTextStyle.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () => context.pop(),
          child: Text(
            AppStrings.signIn,
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











