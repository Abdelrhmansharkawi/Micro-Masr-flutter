import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class OtpIllustration extends StatelessWidget {
  const OtpIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: EdgeInsets.all(32.aw),
            decoration: BoxDecoration(
              color: context.colors.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              Icons.chat_bubble_rounded,
              size: 64.aw,
              color: const Color(0xFF81A28A),
            ),
          ),
          Positioned(
            right: 10.aw,
            top: 10.ah,
            child: Container(
              width: 24.aw,
              height: 24.aw,
              decoration: const BoxDecoration(
                color: Color(0xFFF09063),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.notifications, size: 14.aw, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}











