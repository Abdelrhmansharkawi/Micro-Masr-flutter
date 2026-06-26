import 'package:flutter/material.dart';

class TrackingMapPlaceholder extends StatelessWidget {
  const TrackingMapPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F8E9),
        image: DecorationImage(
          image: NetworkImage('https:/placeholder.com/map'), // Real map will replace this
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Stack(
        children: [
          // Simulated path
          Positioned(
            top: 300,
            left: 100,
            child: Icon(Icons.directions_bus, color: const Color(0xFF558B2F), size: 40),
          ),
          Positioned(
            top: 200,
            left: 200,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Color(0xFFF09063), shape: BoxShape.circle),
              child: const Icon(Icons.person_pin_circle, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}











