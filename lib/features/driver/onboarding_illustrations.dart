import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/size_extensions.dart';

// Slide 1 illustration: Driver home dashboard mockup
// showing availability toggle, earnings, and stats.
class DriverHomeIllustration extends StatelessWidget {
  const DriverHomeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final green = const Color(0xFF2D5016);
    final orange = const Color(0xFFE8844A);
    final lightGreen = const Color(0xFF4E7A2B);
    final cream = const Color(0xFFF5F3EC);

    return Container(
      color: cream,
      padding: EdgeInsets.all(AppSpacing.lg.aw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.notifications_none_rounded,
                  color: green, size: 22.aw),
              Row(
                children: [
                  Text(
                    '👋 أهلاً يا أحمد',
                    style: TextStyle(
                      fontSize: 13.aw,
                      fontWeight: FontWeight.w600,
                      color: green,
                    ),
                  ),
                  SizedBox(width: 8.aw),
                  CircleAvatar(
                    radius: 16.aw,
                    backgroundColor: green,
                    child: Icon(Icons.person, color: Colors.white, size: 16.aw),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.ah),

          // Availability toggle
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.aw, vertical: 8.ah),
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'متاح للرحلات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.aw,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 38.aw,
                  height: 22.ah,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.all(3.aw),
                      width: 16.aw,
                      height: 16.aw,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.ah),

          // Earnings card
          Container(
            padding: EdgeInsets.all(12.aw),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('أرباح اليوم',
                    style: TextStyle(
                        fontSize: 11.aw, color: Colors.grey[600])),
                SizedBox(height: 4.ah),
                Text(
                  '٢٤٥ جنيه',
                  style: TextStyle(
                    fontSize: 22.aw,
                    fontWeight: FontWeight.w800,
                    color: orange,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          SizedBox(height: 12.ah),

          // Stats row
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.aw),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.star_rounded,
                          color: orange, size: 18.aw),
                      SizedBox(height: 4.ah),
                      Text('٤.٩',
                          style: TextStyle(
                              fontSize: 13.aw,
                              fontWeight: FontWeight.w700,
                              color: green)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.aw),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.aw),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.route_rounded,
                          color: green, size: 18.aw),
                      SizedBox(height: 4.ah),
                      Text('٨ رحلات',
                          style: TextStyle(
                              fontSize: 13.aw,
                              fontWeight: FontWeight.w700,
                              color: green)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Slide 2 illustration: Incoming trip request card
// showing passenger details, route, and fare.
class TripRequestIllustration extends StatelessWidget {
  const TripRequestIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final darkGreen = const Color(0xFF1A2E0F);
    final orange = const Color(0xFFE8844A);
    final cream = const Color(0xFFF5F3EC);

    return Container(
      color: cream,
      padding: EdgeInsets.all(AppSpacing.lg.aw),
      child: Container(
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16.aw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'طلب رحلة جديد',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12.aw),
            ),
            SizedBox(height: 10.ah),

            // Timer circle
            Container(
              width: 56.aw,
              height: 56.aw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: orange, width: 3.aw),
              ),
              child: Center(
                child: Text(
                  '٢١',
                  style: TextStyle(
                    color: orange,
                    fontSize: 22.aw,
                    fontWeight: FontWeight.w800,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            SizedBox(height: 12.ah),

            // Passenger row
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 12.aw, vertical: 8.ah),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Color(0xFFFFB800), size: 14),
                      SizedBox(width: 4.aw),
                      Text('٤.٨',
                          style: TextStyle(
                              color: Colors.white, fontSize: 12.aw)),
                    ],
                  ),
                  Text(
                    'محمد جلال',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.aw,
                      fontWeight: FontWeight.w700,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.ah),

            // Route
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('محطة مصر',
                    style: TextStyle(
                        color: Colors.white, fontSize: 12.aw)),
                SizedBox(width: 8.aw),
                const Icon(Icons.circle,
                    color: Colors.greenAccent, size: 10),
              ],
            ),
            SizedBox(height: 4.ah),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('الجامعة',
                    style: TextStyle(
                        color: Colors.white70, fontSize: 12.aw)),
                SizedBox(width: 8.aw),
                const Icon(Icons.square_rounded,
                    color: Color(0xFFE8844A), size: 10),
              ],
            ),
            SizedBox(height: 12.ah),

            // Fare
            Text(
              '٣٢ جنيه',
              style: TextStyle(
                color: orange,
                fontSize: 26.aw,
                fontWeight: FontWeight.w800,
              ),
              textDirection: TextDirection.rtl,
            ),
            Text(
              'الأجر المتوقع',
              style: TextStyle(
                  color: Colors.white54, fontSize: 10.aw),
            ),
          ],
        ),
      ),
    );
  }
}

// Slide 3 illustration: Earnings chart card
// showing bar chart and balance with withdraw button.
class EarningsIllustration extends StatelessWidget {
  const EarningsIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final orange = const Color(0xFFE8844A);
    final cream = const Color(0xFFF5F3EC);
    final barHeights = [0.35, 0.55, 0.45, 0.7, 1.0, 0.6, 0.5];

    return Container(
      color: cream,
      padding: EdgeInsets.all(AppSpacing.lg.aw),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
            ),
          ],
        ),
        padding: EdgeInsets.all(16.aw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'أرباحي',
              style: TextStyle(
                fontSize: 16.aw,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1A2E0F),
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 4.ah),
            Text(
              'الرصيد المتاح',
              style: TextStyle(
                  fontSize: 11.aw,
                  color: Colors.grey[500]),
            ),
            SizedBox(height: 4.ah),
            Text(
              '١٢٨٠ جنيه',
              style: TextStyle(
                fontSize: 28.aw,
                fontWeight: FontWeight.w800,
                color: orange,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 4.ah),
            Text(
              'اليوم',
              style: TextStyle(
                  fontSize: 10.aw,
                  color: Colors.grey[500]),
            ),
            SizedBox(height: 12.ah),

            // Bar chart
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: barHeights.asMap().entries.map((entry) {
                  final isActive = entry.key == 4;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.aw),
                      child: FractionallySizedBox(
                        heightFactor: entry.value,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFF4E7A2B)
                                : const Color(0xFFD6E8C8),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 12.ah),

            // Withdraw button
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.ah, horizontal: 24.aw),
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'سحب الأرباح',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.aw,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}











