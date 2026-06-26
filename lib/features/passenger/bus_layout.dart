import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';

class BusLayout extends StatelessWidget {
  final Set<int> selectedSeats;
  final List<int> reservedSeats;
  final Function(int) onSeatToggled;
  final int totalSeats;

  const BusLayout({
    super.key,
    required this.selectedSeats,
    required this.reservedSeats,
    required this.onSeatToggled,
    required this.totalSeats,
  });

  static int _gridIndexFromSeat(int seat) {
    final int row = seat ~/ 3;
    final int remainder = seat % 3;
    final int col = remainder == 2 ? 3 : remainder;
    return row * 4 + col;
  }

  static int? _seatFromGridIndex(int gridIndex, int totalSeats) {
    final int row = gridIndex ~/ 4;
    final int col = gridIndex % 4;
    if (col == 2) return null;
    final int seat = row * 3 + (col == 3 ? 2 : col);
    return seat < totalSeats ? seat : null;
  }

  @override
  Widget build(BuildContext context) {
    final int rows = (totalSeats / 3).ceil();
    final int totalPositions = rows * 4;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.aw),
      padding: EdgeInsets.all(24.aw),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: context.colors.outline.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          _buildDriverSection(context),
          const VerticalSpace(24),
          const Divider(),
          const VerticalSpace(24),
          Expanded(child: _buildSeatsGrid(context, totalPositions)),
        ],
      ),
    );
  }

  Widget _buildDriverSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Icon(Icons.directions_bus,
                size: 32, color: Color(0xFF757575)),
            Text(AppStrings.driverLabel, style: context.bodySmallTextStyle),
          ],
        ),
      ],
    );
  }

  Widget _buildSeatsGrid(BuildContext context, int totalPositions) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, gridIndex) {
        final seat = _seatFromGridIndex(gridIndex, totalSeats);
        if (seat == null) return const SizedBox.shrink();
        return _buildSeat(context, seat);
      },
      itemCount: totalPositions,
    );
  }

  Widget _buildSeat(BuildContext context, int physicalSeat) {
    final isReserved = reservedSeats.contains(physicalSeat);
    final isSelected = selectedSeats.contains(physicalSeat);

    final color = isSelected
        ? const Color(0xFFF09063)
        : (isReserved ? context.colors.outline : const Color(0xFF9CCC65));
    final icon = isSelected ? Icons.check : (isReserved ? Icons.person : null);

    return GestureDetector(
      onTap: isReserved ? null : () => onSeatToggled(physicalSeat),
      child: Container(
        decoration: BoxDecoration(
          color: icon == null ? Colors.white : color,
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 2),
        ),
        child: icon != null ? Icon(icon, size: 16, color: Colors.white) : null,
      ),
    );
  }
}
