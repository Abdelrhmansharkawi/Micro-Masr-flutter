import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';

class FeedbackTags extends StatefulWidget {
  final List<String> initialTags;
  final Function(List<String>)? onTagsSelected;

  const FeedbackTags({
    super.key,
    this.initialTags = const [],
    this.onTagsSelected,
  });

  @override
  State<FeedbackTags> createState() => _FeedbackTagsState();
}

class _FeedbackTagsState extends State<FeedbackTags> {
  late List<String> _selectedTags;

  final List<String> _tags = [
    AppStrings.safeDriving,
    AppStrings.onTime,
    AppStrings.cleanCar,
    AppStrings.politeDriver,
  ];

  @override
  void initState() {
    super.initState();
    _selectedTags = List.from(widget.initialTags);
  }

  @override
  void didUpdateWidget(covariant FeedbackTags oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTags != widget.initialTags) {
      _selectedTags = List.from(widget.initialTags);
    }
  }

  void _toggleTag(String tag) {
    setState(() {
      if (_selectedTags.contains(tag)) {
        _selectedTags.remove(tag);
      } else {
        _selectedTags.add(tag);
      }
    });
    widget.onTagsSelected?.call(_selectedTags);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: _tags.map((tag) => _buildTag(tag)).toList(),
    );
  }

  Widget _buildTag(String tag) {
    final isSelected = _selectedTags.contains(tag);
    return GestureDetector(
      onTap: () => _toggleTag(tag),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? const Color(0xFFF1F8E9) : context.colors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF9CCC65)
                : context.colors.outline.withValues(alpha: 0.5),
          ),
        ),
        child: Text(
          tag,
          style: context.bodySmallTextStyle.copyWith(
            color: isSelected
                ? const Color(0xFF558B2F)
                : context.colors.textSecondary,
            fontWeight: isSelected ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}
