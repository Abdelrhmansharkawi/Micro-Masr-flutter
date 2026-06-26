import 'package:flutter/material.dart';
import 'package:micromasr/features/driver/driver_home_screen.dart';
import 'package:micromasr/features/driver/driver_earnings_screen.dart';
import 'package:micromasr/features/driver/driver_profile_screen.dart';
import 'package:micromasr/features/driver/driver_trips_screen.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class DriverFlowScreen extends StatefulWidget {
  const DriverFlowScreen({super.key});

  @override
  State<DriverFlowScreen> createState() => _DriverFlowScreenState();
}

class _DriverFlowScreenState extends State<DriverFlowScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DriverHomeScreen(),
    DriverEarningsScreen(),
    DriverTripsScreen(),
    DriverProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    const darkGreen = Color(0xFF4A7450);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2EFE8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: const Color(0xFFF2EFE8),
          selectedItemColor: darkGreen,
          unselectedItemColor: context.colors.textSecondary.withValues(alpha: 0.6),
          selectedLabelStyle: context.bodySmallTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: darkGreen,
            fontSize: 10,
          ),
          unselectedLabelStyle: context.bodySmallTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home_outlined, 0),
              activeIcon: _buildIcon(Icons.home_rounded, 0, isActive: true),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.account_balance_wallet_outlined, 1),
              activeIcon: _buildIcon(Icons.account_balance_wallet, 1, isActive: true),
              label: AppStrings.earnings,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.directions_bus_outlined, 2),
              activeIcon: _buildIcon(Icons.directions_bus, 2, isActive: true),
              label: AppStrings.tripsCount,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person_outline, 3),
              activeIcon: _buildIcon(Icons.person, 3, isActive: true),
              label: AppStrings.profile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, size: 24.aw),
        if (isActive)
          Container(
            margin: EdgeInsets.only(top: 4.ah),
            width: 4.aw,
            height: 4.aw,
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              shape: BoxShape.circle,
            ),
          )
        else
          SizedBox(height: 8.ah),
      ],
    );
  }
}












