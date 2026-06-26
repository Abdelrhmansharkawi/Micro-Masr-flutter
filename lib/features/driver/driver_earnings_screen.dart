import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/balance_card.dart';
import 'package:micromasr/features/driver/earnings_header_widgets.dart';
import 'package:micromasr/features/driver/earnings_stats_widgets.dart';
import 'package:micromasr/features/driver/weekly_chart_card.dart';

class DriverEarningsScreen extends StatelessWidget {
  const DriverEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4A7450);
    const orangeColor = Color(0xFFE28B5A);

    // Dummy earnings data
    final earnings = DummyEarnings(
      totalBalance: 1250.75,
      todayEarnings: 120.0,
      todayTrips: 5,
      transactions: [
        DummyTransaction(id: "1", amount: 45.0, date: "اليوم", type: "رحلة"),
        DummyTransaction(id: "2", amount: 75.0, date: "اليوم", type: "رحلة"),
        DummyTransaction(id: "3", amount: 150.0, date: "أمس", type: "سحب"),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg.aw, 
            vertical: AppSpacing.md.ah,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const EarningsHeader(darkGreen: darkGreen),
              SizedBox(height: AppSpacing.xl.ah),
              const TimeFilterRow(darkGreen: darkGreen),
              SizedBox(height: AppSpacing.md.ah),
              BalanceCard(earnings: earnings, darkGreen: darkGreen, orangeColor: orangeColor),
              SizedBox(height: AppSpacing.lg.ah),
              const WeeklyChartCard(darkGreen: darkGreen),
              SizedBox(height: AppSpacing.lg.ah),
              TodayDetailsCard(earnings: earnings, darkGreen: darkGreen),
              SizedBox(height: AppSpacing.lg.ah),
              TransactionsCard(
                transactions: earnings.transactions, 
                darkGreen: darkGreen, 
                orangeColor: orangeColor,
              ),
              SizedBox(height: AppSpacing.xxl.ah),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyEarnings {
  final double totalBalance;
  final double todayEarnings;
  final int todayTrips;
  final List<DummyTransaction> transactions;

  DummyEarnings({
    required this.totalBalance,
    required this.todayEarnings,
    required this.todayTrips,
    required this.transactions,
  });
}

class DummyTransaction {
  final String id;
  final double amount;
  final String date;
  final String type;

  DummyTransaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.type,
  });
}












