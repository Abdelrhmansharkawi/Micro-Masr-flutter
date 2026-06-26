import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class TripsFilterTabs extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabSelected;
  final Color darkGreen;

  const TripsFilterTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    required this.darkGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.ah, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(children: [
        _Tab(title: 'الملغية', isSelected: selectedTab == 1, color: darkGreen, onTap: () => onTabSelected(1)),
        _Tab(title: 'المكتملة', isSelected: selectedTab == 0, color: darkGreen, onTap: () => onTabSelected(0)),
      ]),
    );
  }
}

class _Tab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _Tab({required this.title, required this.isSelected, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: isSelected ? color : Colors.transparent, borderRadius: BorderRadius.circular(24)),
          alignment: Alignment.center,
          child: Text(title, style: context.titleMediumTextStyle.copyWith(color: isSelected ? Colors.white : color, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}











