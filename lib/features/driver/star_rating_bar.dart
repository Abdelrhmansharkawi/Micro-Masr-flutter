import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class StarRatingBar extends StatelessWidget {
  final int selectedRating;
  final Function(int) onRatingChanged;
  final bool isSubmitting;

  const StarRatingBar({
    super.key,
    required this.selectedRating,
    required this.onRatingChanged,
    required this.isSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        return IconButton(
          iconSize: 40.aw,
          icon: Icon(
            starIndex <= selectedRating ? Icons.star_rounded : Icons.star_outline_rounded,
            color: starIndex <= selectedRating ? Colors.amber : context.colors.outline,
          ),
          onPressed: isSubmitting ? null : () => onRatingChanged(starIndex),
        );
      }),
    );
  }
}











