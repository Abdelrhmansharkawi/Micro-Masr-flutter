import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'rating_stars.dart';
import 'feedback_tags.dart';

class ReviewDriverCard extends StatefulWidget {
  final String driverName;
  final String vehicleInfo;
  final Function(int)? onRatingChanged;
  final Function(List<String>)? onTagsChanged;
  final Function(String)? onCommentChanged;

  const ReviewDriverCard({
    super.key,
    required this.driverName,
    required this.vehicleInfo,
    this.onRatingChanged,
    this.onTagsChanged,
    this.onCommentChanged,
  });

  @override
  State<ReviewDriverCard> createState() => _ReviewDriverCardState();
}

class _ReviewDriverCardState extends State<ReviewDriverCard> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentController.addListener(() {
      widget.onCommentChanged?.call(_commentController.text);
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          const VerticalSpace(12),
          Text(
            widget.driverName,
            style: context.titleLargeTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.vehicleInfo,
            style: context.bodyMediumTextStyle.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const VerticalSpace(24),
          RatingStars(
            onRatingChanged: widget.onRatingChanged,
          ),
          const VerticalSpace(24),
          Text(
            AppStrings.whatDidYouLike,
            style: context.titleMediumTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const VerticalSpace(16),
          FeedbackTags(
            onTagsSelected: widget.onTagsChanged,
          ),
          const VerticalSpace(24),
          _buildCommentBox(context),
        ],
      ),
    );
  }

  Widget _buildCommentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _commentController,
        decoration: InputDecoration(
          hintText: 'شاركنا رأيك...',
          hintStyle: context.bodyMediumTextStyle.copyWith(
            color: context.colors.textSecondary,
          ),
          border: InputBorder.none,
        ),
        maxLines: 3,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
