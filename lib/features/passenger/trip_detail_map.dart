import 'package:flutter/material.dart';

class TripDetailMap extends StatelessWidget {
  const TripDetailMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFDCEDC8),
      ),
      child: Center(
        child: Icon(Icons.map_outlined, size: 100, color: Colors.white.withValues(alpha: 0.5)),
      ),
    );
  }
}











