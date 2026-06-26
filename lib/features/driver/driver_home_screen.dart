import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/home_header.dart';
import 'package:micromasr/features/driver/home_stats_row.dart';
import 'package:micromasr/features/driver/incoming_request_card.dart';
import 'package:micromasr/features/driver/quick_access_grid.dart';
import 'package:micromasr/features/driver/status_toggle_card.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    const Color darkGreen = Color(0xFF4A7450);
    
    // Dummy stats
    final stats = DummyDriverStats(
      isOnline: _isOnline,
      earnings: 450.50,
      trips: 12,
      rating: 4.9,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HomeHeader(darkGreen: darkGreen),
              SizedBox(height: AppSpacing.xl.ah),
              StatusToggleCard(
                darkGreen: darkGreen, 
                isOnline: _isOnline,
                onToggle: (v) => setState(() => _isOnline = v),
              ),
              SizedBox(height: AppSpacing.lg.ah),
              const IncomingRequestCard(),
              SizedBox(height: AppSpacing.lg.ah),
              HomeStatsRow(darkGreen: darkGreen, stats: stats),
              SizedBox(height: AppSpacing.xl.ah),
              const QuickAccessSection(darkGreen: darkGreen),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyDriverStats {
  final bool isOnline;
  final double earnings;
  final int trips;
  final double rating;

  DummyDriverStats({
    required this.isOnline,
    required this.earnings,
    required this.trips,
    required this.rating,
  });
}












