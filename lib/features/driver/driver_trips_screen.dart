import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/trip_history_card.dart';
import 'package:micromasr/features/driver/trips_filter_tabs.dart';
import 'package:micromasr/features/driver/trips_header.dart';
import 'package:micromasr/features/driver/trips_stats_row.dart';

class DriverTripsScreen extends StatefulWidget {
  const DriverTripsScreen({super.key});
  @override
  State<DriverTripsScreen> createState() => _DriverTripsScreenState();
}

class _DriverTripsScreenState extends State<DriverTripsScreen> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF2EFE8);
    const darkGreen = Color(0xFF4A7450);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            TripsHeader(darkGreen: darkGreen),
            SizedBox(height: AppSpacing.md.ah),
            TripsStatsRow(darkGreen: darkGreen),
            SizedBox(height: AppSpacing.lg.ah),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw),
              child: TripsFilterTabs(selectedTab: _selectedTab, darkGreen: darkGreen, onTabSelected: (i) => setState(() => _selectedTab = i)),
            ),
            SizedBox(height: AppSpacing.lg.ah),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw),
                children: [
                  _DateHeader(darkGreen: darkGreen),
                  SizedBox(height: AppSpacing.md.ah),
                  ..._buildTripList(),
                  SizedBox(height: AppSpacing.xxl.ah),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTripList() {
    if (_selectedTab == 0) {
      return [
        const TripHistoryCard(time: '٩:١٥ ص', status: 'مكتملة ✓', isCompleted: true, origin: 'محطة مصر', destination: 'الجامعة', passengerName: 'محمد جلال', rating: '٥⭐️', seats: 'مقعد ٤،٣', price: '٣٢'),
        SizedBox(height: AppSpacing.md.ah),
        const TripHistoryCard(time: '٨:٣٠ ص', status: 'مكتملة ✓', isCompleted: true, origin: 'سيدي جابر', destination: 'محطة مصر', passengerName: 'سارة أحمد', rating: '٤.٨⭐️', seats: 'مقعد ١', price: '١٥'),
      ];
    }
    return [
      const TripHistoryCard(time: '٧:٤٥ ص', status: 'ملغية ✕', isCompleted: false, origin: 'المندرة', destination: 'سيدي بشر', passengerName: 'إلغاء الراكب', rating: '', seats: '', price: '٠'),
    ];
  }
}

class _DateHeader extends StatelessWidget {
  final Color darkGreen;
  const _DateHeader({required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text('اليوم، السبت ٢٠ أبريل', style: context.bodySmallTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
    );
  }
}











