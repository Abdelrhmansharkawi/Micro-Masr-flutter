import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'trip_summary_card.dart';
import 'price_breakdown_card.dart';
import 'booking_confirm_header.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';
import 'package:micromasr/features/passenger/data/services/booking_service.dart';
import 'package:dio/dio.dart';

class BookingConfirmScreen extends StatefulWidget {
  final TripModel trip;
  final List<int> selectedSeats;

  const BookingConfirmScreen({
    super.key,
    required this.trip,
    required this.selectedSeats,
  });

  @override
  State<BookingConfirmScreen> createState() => _BookingConfirmScreenState();
}

class _BookingConfirmScreenState extends State<BookingConfirmScreen> {
  final BookingService _bookingService = BookingService();
  bool _isLoading = false;

  Future<void> _confirmAndPay() async {
    setState(() => _isLoading = true);
    try {
      final booking = await _bookingService.createBooking(
        tripId: widget.trip.id,
        seats: widget.selectedSeats,
        pickupName: widget.trip.startLocation.name ?? 'Unknown',
        pickupCoords: widget.trip.startLocation.coordinates,
        dropoffName: widget.trip.endLocation.name ?? 'Unknown',
        dropoffCoords: widget.trip.endLocation.coordinates,
      );

      if (mounted) {
        context.push(
          AppRouteConstants.passengerPayment,
          extra: {
            'bookingId': booking['_id'],
            'amount': booking['totalPrice'],
            'bookingData': booking,
          },
        );
      }
    } on DioException catch (e) {
      String message = 'Booking failed';
      if (e.response != null) {
        final data = e.response!.data;
        if (data is Map && data['message'] != null) {
          message = data['message'].toString();
        } else {
          message =
              'Error ${e.response?.statusCode}: ${e.response?.statusMessage}';
        }
      }
      debugPrint('Booking error: $message');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } catch (e) {
      debugPrint('Unexpected error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Something went wrong')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: BookingConfirmHeader()),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const VerticalSpace(16),
                    TripSummaryCard(
                      trip: widget.trip,
                      selectedSeats: widget.selectedSeats,
                    ),
                    const VerticalSpace(20),
                    PriceBreakdownCard(
                      trip: widget.trip,
                      seatCount: widget.selectedSeats.length,
                    ),
                    const VerticalSpace(32),
                  ],
                ),
              ),
            ),
            _buildBottomActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32))),
      child: Column(
        children: [
          AppButton(
            label: AppStrings.confirmAndPay,
            // Uses an empty block function instead of null to fit strict VoidCallback requirements
            onPressed: _isLoading
                ? () {}
                : () {
                    _confirmAndPay();
                  },
          ),
          const VerticalSpace(12),
          AppButton.text(
            label: AppStrings.cancel,
            // Prevents popping the screen context while processing an API call
            onPressed: _isLoading
                ? () {}
                : () {
                    context.pop();
                  },
          ),
        ],
      ),
    );
  }
}
