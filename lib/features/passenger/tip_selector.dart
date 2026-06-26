import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';

class TipSelector extends StatefulWidget {
  final Function(double)? onTipSelected;

  const TipSelector({super.key, this.onTipSelected});

  @override
  State<TipSelector> createState() => _TipSelectorState();
}

class _TipSelectorState extends State<TipSelector> {
  double? _selectedTip;

  final List<double> _presetTips = [5, 10, 20];
  final TextEditingController _customController = TextEditingController();

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  void _selectTip(double? value) {
    setState(() {
      _selectedTip = value;
    });
    widget.onTipSelected?.call(value ?? 0);
  }

  void _showCustomTipDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('مبلغ الإكرامية'),
        content: TextField(
          controller: _customController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'أدخل المبلغ (جنيه)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              final amount = double.tryParse(_customController.text);
              if (amount != null && amount > 0) {
                _selectTip(amount);
              }
              Navigator.pop(ctx);
            },
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ..._presetTips.map((tip) => _buildTipButton(tip, '+$tip جنيه')),
        _buildTipButton(null, 'مبلغ آخر', onTap: _showCustomTipDialog),
      ],
    );
  }

  Widget _buildTipButton(double? value, String label, {VoidCallback? onTap}) {
    final isSelected = _selectedTip == value;
    return GestureDetector(
      onTap: onTap ?? (() => _selectTip(value)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          label,
          style: context.bodyMediumTextStyle.copyWith(
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
