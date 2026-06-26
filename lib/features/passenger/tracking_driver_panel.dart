import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'data/models/tracking_model.dart';

class TrackingDriverPanel extends StatelessWidget {
  final TrackingData trackingData;
  final VoidCallback? onEndTrip;

  const TrackingDriverPanel({
    super.key,
    required this.trackingData,
    this.onEndTrip,
  });

  @override
  Widget build(BuildContext context) {
    final driver = trackingData.driver;
    final vehicle = driver.vehicle;
    final price = trackingData.booking.totalPrice;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        children: [
          _buildHandle(),
          const VerticalSpace(16),
          _buildDriverInfo(context, driver.fullName,
              '${vehicle.model} ${vehicle.color} - ${vehicle.plateNumber}'),
          const VerticalSpace(20),
          _buildCostPreview(context, price.toInt()),
          const VerticalSpace(20),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildDriverInfo(
      BuildContext context, String fullName, String vehicleDesc) {
    return Row(
      children: [
        CircleAvatar(
            radius: 28, child: Text(fullName.isNotEmpty ? fullName[0] : '?')),
        const HorizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fullName,
                  style: context.titleLargeTextStyle
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(vehicleDesc,
                  style: context.bodyMediumTextStyle
                      .copyWith(color: context.colors.textSecondary)),
            ],
          ),
        ),
        const HorizontalSpace(16),
        _buildContactIcons(context),
      ],
    );
  }

  Widget _buildContactIcons(BuildContext context) {
    return Row(
      children: [
        _buildCircleIcon(context, Icons.phone_outlined,
            color: const Color(0xFF558B2F)),
        const HorizontalSpace(12),
        _buildCircleIcon(context, Icons.chat_bubble_outline),
      ],
    );
  }

  Widget _buildCircleIcon(BuildContext context, IconData icon, {Color? color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.background,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.5),
        ),
      ),
      child: Icon(
        icon,
        color: color ?? context.colors.textSecondary,
        size: 24,
      ),
    );
  }

  Widget _buildCostPreview(BuildContext context, int price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F8E9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.tripCost,
              style: context.bodyMediumTextStyle
                  .copyWith(color: context.colors.textSecondary)),
          Text('$price ${AppStrings.egp}',
              style: context.titleLargeTextStyle.copyWith(
                  color: const Color(0xFFF09063), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionBtn(
          context,
          AppStrings.shareTripRoute,
          Icons.share_outlined,
          context.colors.background,
          context.colors.textSecondary,
        ),
        const HorizontalSpace(12),
        _buildActionBtn(
          context,
          AppStrings.sos,
          Icons.warning_amber,
          const Color(0xFFFFEBEE),
          const Color(0xFFE53935),
        ),
        const HorizontalSpace(12),
        _buildActionBtn(
          context,
          'إنهاء',
          Icons.flag_outlined,
          const Color(0xFFFFF3E0),
          const Color(0xFFE65100),
          onTap: () => _confirmEndTrip(context),
        ),
      ],
    );
  }

  void _confirmEndTrip(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('إنهاء الرحلة'),
        content: const Text('هل أنت متأكد من إنهاء الرحلة الحالية؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onEndTrip?.call();
            },
            style:
                TextButton.styleFrom(foregroundColor: const Color(0xFFE65100)),
            child: const Text('إنهاء'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(
    BuildContext context,
    String label,
    IconData icon,
    Color bg,
    Color color, {
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.colors.outline.withValues(alpha: 0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 18), 
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  style: context.bodyMediumTextStyle.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
