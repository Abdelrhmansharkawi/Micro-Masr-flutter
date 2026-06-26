import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  final Function(int)? onRatingChanged;
  final int initialRating;

  const RatingStars({
    super.key,
    this.onRatingChanged,
    this.initialRating = 0,
  });

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1;
            });
            widget.onRatingChanged?.call(_rating);
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.orange,
            size: 40,
          ),
        );
      }),
    );
  }
}
