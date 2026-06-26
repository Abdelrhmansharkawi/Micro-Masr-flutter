import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/features/passenger/login_header.dart';
import 'login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(),
            Padding(
              padding: EdgeInsets.all(24),
              child: LoginBody(),
            ),
          ],
        ),
      ),
    );
  }
}












