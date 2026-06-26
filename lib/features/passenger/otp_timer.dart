import 'dart:async';
import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key, required this.onResend});

  final VoidCallback onResend;

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  int _secondsRemaining = 45;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (_secondsRemaining == 0) {
      return TextButton(
        onPressed: () {
          setState(() => _secondsRemaining = 45);
          _startTimer();
          widget.onResend();
        },
        child: Text(
          'إعادة إرسال الكود',
          style: context.bodyLargeTextStyle.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Text(
      'إعادة إرسال الكود خلال ${_formatTime(_secondsRemaining)}',
      style: context.bodyMediumTextStyle.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }
}











