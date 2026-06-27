import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/vertical_space.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String phone;
  final String avatarInitial;
  final bool isVerified;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.phone,
    required this.avatarInitial,  
    this.isVerified = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 240.ah,
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.ar),
              bottomRight: Radius.circular(40.ar),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(20),
              Stack(
                children: [
                  Container(
                    width: 90.aw,
                    height: 90.aw,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB5D1B9), 
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 4),
                    ),
                    child: Center(
                      child: Text(
                        avatarInitial,
                        style: context.headlineLargeTextStyle.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    start: 4.aw,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.lightGreen,
                        size: 20.aw,
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpace(12),
              Text(
                name,
                style: context.headlineLargeTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const VerticalSpace(4),
              Text(
                phone,
                style: context.bodyMediumTextStyle.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 40.ah,
          end: 20.aw,
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit_outlined,
                color: Colors.white,
                size: 18.aw,
              ),
            ),
            onPressed: () => context.go(AppRouteConstants.passengerProfile),
          ),
        ),
      ],
    );
  }
}











