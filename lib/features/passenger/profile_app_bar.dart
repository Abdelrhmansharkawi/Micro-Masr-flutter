import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ProfileAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: context.titleLargeTextStyle.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: context.colors.primary),
        onPressed: () => context.go(AppRouteConstants.passengerProfile),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.aw),
          child: Center(
            child: Text(
              'Micro Masr',
              style: context.bodySmallTextStyle.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}











