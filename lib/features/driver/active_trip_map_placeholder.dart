import 'package:flutter/material.dart';
import 'package:micromasr/core/size_extensions.dart';

class ActiveTripMapPlaceholder extends StatelessWidget {
  final Color darkGreen;
  final Color orangeColor;

  const ActiveTripMapPlaceholder({
    super.key,
    required this.darkGreen,
    required this.orangeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Stack(
        children: [
          Positioned(
            top: 200.ah, left: 100.aw,
            child: Container(width: 5.aw, height: 300.ah, color: darkGreen.withValues(alpha: 0.5)),
          ),
          Positioned(
            top: 250.ah, left: 90.aw,
            child: Icon(Icons.navigation, color: orangeColor, size: 32.aw),
          ),
          const Center(
            child: Text(
              'خريطة حية\n(Live Map Placeholder)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0x33000000), fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}











