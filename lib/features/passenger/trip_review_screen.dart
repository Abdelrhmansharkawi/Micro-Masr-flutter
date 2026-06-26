import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'review_header.dart';
import 'review_driver_card.dart';
import 'tip_selector.dart';
import 'data/services/review_service.dart';

class TripReviewScreen extends StatefulWidget {
  final String tripId;
  final String driverName;
  final String vehicleInfo;
  final double totalPrice;
  final String bookingId;
  final String tripDistance; 
  final int durationMinutes;

  const TripReviewScreen({
    super.key,
    required this.tripId,
    required this.driverName,
    required this.vehicleInfo,
    required this.totalPrice,
    required this.bookingId,
    required this.tripDistance, 
    required this.durationMinutes,
  });

  @override
  State<TripReviewScreen> createState() => _TripReviewScreenState();
}

class _TripReviewScreenState extends State<TripReviewScreen> {
  final ReviewService _reviewService = ReviewService();

  // Collected review data
  int _rating = 0;
  List<String> _selectedTags = [];
  double _tipAmount = 0;
  String _comment = '';
  bool _isSubmitting = false;

  Future<void> _submitReview() async {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إضافة تقييم للرحلة')),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      await _reviewService.submitReview(
        tripId: widget.tripId,
        rating: _rating,
        comment: _comment,
        tags: _selectedTags,
        tipAmount: _tipAmount,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('شكراً لتقييمك!')),
        );
        context.go(AppRouteConstants.passengerHome);
      }
    } catch (e) {
      if (mounted) {
        String message = e.toString();
        if (message.startsWith('Exception: ')) message = message.substring(10);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: Column(
        children: [
          ReviewHeader(
            tripDistance: widget.tripDistance, // You can make dynamic if needed
            durationMinutes: widget.durationMinutes,
            price: widget.totalPrice.toInt(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  ReviewDriverCard(
                    driverName: widget.driverName,
                    vehicleInfo: widget.vehicleInfo,
                    onRatingChanged: (rating) => _rating = rating,
                    onTagsChanged: (tags) => _selectedTags = tags,
                    onCommentChanged: (comment) => _comment = comment,
                  ),
                  const VerticalSpace(20),
                  _buildTipCard(context),
                ],
              ),
            ),
          ),
          _buildBottomActions(context),
        ],
      ),
    );
  }

  Widget _buildTipCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.payments, color: Color(0xFFF09063)),
              const SizedBox(width: 8),
              Text(
                AppStrings.addTipOptional,
                style: context.titleMediumTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const VerticalSpace(16),
          TipSelector(
            onTipSelected: (amount) => _tipAmount = amount,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          AppButton(
            label: AppStrings.sendReview,
            onPressed: _submitReview,
            isLoading: _isSubmitting,
          ),
          const VerticalSpace(12),
          AppButton.text(
            label: AppStrings.skip,
            onPressed: () => context.go(AppRouteConstants.passengerHome),
          ),
        ],
      ),
    );
  }
}
