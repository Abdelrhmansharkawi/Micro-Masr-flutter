import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/data/services/user_service.dart';
import 'success_trip_card.dart';
import 'package:intl/intl.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final Map<String, dynamic> bookingData;
  const PaymentSuccessScreen({super.key, required this.bookingData});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  String _userName = '';
  bool _loadingName = true;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final bookingUser = widget.bookingData['user'] as Map<String, dynamic>?;
    if (bookingUser != null && bookingUser['fullName'] != null) {
      setState(() {
        _userName = bookingUser['fullName'];
        _loadingName = false;
      });
      return;
    }

    try {
      final userService = UserService();
      final user = await userService.getMe();
      setState(() {
        _userName = user.firstName;
        _loadingName = false;
      });
    } catch (_) {
      setState(() {
        _userName = 'there';
        _loadingName = false;
      });
    }
  }

  String _formatDepartureTime(String? isoString) {
    if (isoString == null) return 'Today, 9:00 AM';
    try {
      final dt = DateTime.parse(isoString);
      final now = DateTime.now();
      final isToday =
          dt.year == now.year && dt.month == now.month && dt.day == now.day;
      final timeFormat = DateFormat('h:mm a', 'en'); 
      if (isToday) {
        return 'Today, ${timeFormat.format(dt)}';
      } else {
        final dateFormat = DateFormat('d MMMM', 'en');
        return '${dateFormat.format(dt)}, ${timeFormat.format(dt)}';
      }
    } catch (_) {
      return isoString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingId = widget.bookingData['_id']?.toString() ?? 'N/A';
    final tripRoute =
        '${widget.bookingData['trip']?['startLocation']?['name'] ?? ''} ← ${widget.bookingData['trip']?['endLocation']?['name'] ?? ''}';
    final departureTime = _formatDepartureTime(
        widget.bookingData['trip']?['departureTime']?.toString());

    final tripId = widget.bookingData['trip'] is Map
        ? widget.bookingData['trip']['_id']
        : widget.bookingData['trip'];

    return Scaffold(
      backgroundColor:
          const Color(0xFF558B2F), 
      body: SafeArea(
        child: Column(
          children: [
            const VerticalSpace(60),
            _buildCheckmark(),
            const VerticalSpace(24),
            Text(AppStrings.paymentSuccessful,
                style: context.headlineLargeTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const VerticalSpace(8),
            _buildSuccessMessage(context),
            const VerticalSpace(12),
            Text('${AppStrings.bookingNumber} $bookingId',
                style: context.bodyMediumTextStyle
                    .copyWith(color: Colors.white.withValues(alpha: 0.8))),
            const VerticalSpace(40),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SuccessTripCard(
                  route: tripRoute,
                  departureTime: departureTime,
                )),
            const Spacer(),
            _buildActions(context, tripId),
            const VerticalSpace(24),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckmark() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Color(0xFF9CCC65), shape: BoxShape.circle),
        child: const Icon(Icons.check, color: Colors.white, size: 40),
      ),
    );
  }

  Widget _buildSuccessMessage(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.bodyLargeTextStyle.copyWith(color: Colors.white),
        children: [
          const TextSpan(text: 'حجزك اتأكد يا '),
          TextSpan(
              text: _userName,
              style: context.bodyLargeTextStyle.copyWith(
                  color: const Color(0xFF9CCC65), fontWeight: FontWeight.bold)),
          const TextSpan(text: ' 🎉'),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context, String tripId) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          AppButton(
            label: AppStrings.trackTrip,
            onPressed: () => context.push(AppRouteConstants.passengerTracking
                .replaceAll(':tripId', tripId)),
          ),
          const VerticalSpace(12),
          AppButton.secondary(
            label: AppStrings.backToHome,
            onPressed: () => context.go(AppRouteConstants.passengerHome),
          ),
        ],
      ),
    );
  }
}
