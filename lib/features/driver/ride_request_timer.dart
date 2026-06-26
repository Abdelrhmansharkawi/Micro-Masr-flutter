import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class RideRequestTimer extends StatelessWidget {
  final double value;
  final String seconds;
  final Color orangeColor;
  
  const RideRequestTimer({
    super.key,
    required this.value,
    required this.seconds,
    required this.orangeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 140.aw,
            height: 140.aw,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 8,
              backgroundColor: orangeColor.withValues(alpha: 0.2),
              color: orangeColor,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                seconds,
                style: context.headlineLargeTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 48,
                  height: 1,
                ),
              ),
              Text(
                'ثانية للرد',
                style: context.bodyMediumTextStyle.copyWith(
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}











