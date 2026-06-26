import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_empty_state.dart';

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper({
    super.key,
    required this.isLoading,
    required this.child,
    this.color,
  });

  final bool isLoading;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? context.colors.primary,
        ),
      ),
    );
  }
}

class ErrorWrapper extends StatelessWidget {
  const ErrorWrapper({
    super.key,
    required this.hasError,
    required this.errorMessage,
    required this.child,
    this.onRetry,
  });

  final bool hasError;
  final String errorMessage;
  final Widget child;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    if (!hasError) return child;

    return AppEmptyState(
      icon: Icons.error_outline_rounded,
      title: 'حدث خطأ',
      message: errorMessage,
      actionLabel: onRetry != null ? 'إعادة المحاولة' : null,
      onAction: onRetry,
    );
  }
}

class EmptyWrapper extends StatelessWidget {
  const EmptyWrapper({
    super.key,
    required this.isEmpty,
    required this.message,
    required this.child,
    this.title = 'لا يوجد بيانات',
    this.icon = Icons.inbox_rounded,
  });

  final bool isEmpty;
  final String title;
  final String message;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!isEmpty) return child;

    return AppEmptyState(
      icon: icon,
      title: title,
      message: message,
    );
  }
}
