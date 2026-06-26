import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final int notificationCount;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 12.ah),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildAvatar(context, userName[0]),
          const HorizontalSpace(12),
          _buildUserInfo(context, userName),
          const Spacer(),
          _buildNotificationIcon(context, notificationCount),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context, int count) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: context.colors.background, shape: BoxShape.circle),
          child: Icon(
            Icons.notifications_outlined,
            color: context.colors.textSecondary,
            size: 24.aw,
          ),
        ),
        if (count > 0)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: Color(0xFFF09063), shape: BoxShape.circle),
              child: Text(
                count.toString(),
                style: context.labelSmallTextStyle
                    .copyWith(color: Colors.white, fontSize: 10.sp),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.goodMorning,
          style: context.bodyMediumTextStyle.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(name,
            style: context.bodySmallTextStyle
                .copyWith(color: context.colors.textSecondary)),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, String initial) {
    return Container(
      width: 40.aw,
      height: 40.aw,
      decoration:
          const BoxDecoration(color: Color(0xFF9CCC65), shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: context.titleMediumTextStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
