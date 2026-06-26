import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/rating_states.dart';

class DriverRatingScreen extends StatefulWidget {
  const DriverRatingScreen({super.key});
  @override
  State<DriverRatingScreen> createState() => _DriverRatingScreenState();
}

class _DriverRatingScreenState extends State<DriverRatingScreen> {
  int _rating = 0;
  bool _isSubmitted = false;
  final _commentController = TextEditingController();

  @override
  void dispose() { _commentController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(backgroundColor: context.colors.surface, elevation: 0, title: Text(AppStrings.rateYourTrip, style: context.headlineMediumTextStyle.copyWith(color: context.colors.onSurface))),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(AppSpacing.md.aw), child: _isSubmitted ? const RatingSuccessState() : RatingFormContent(rating: _rating, controller: _commentController, onRatingChanged: (i) => setState(() => _rating = i), onSubmit: () => _rating > 0 ? setState(() => _isSubmitted = true) : null, onSkip: () => Navigator.pop(context)))),
    );
  }
}











