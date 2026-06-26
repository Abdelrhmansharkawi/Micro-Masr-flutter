import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'seats_header.dart';
import 'seats_legend.dart';
import 'bus_layout.dart';
import 'seats_booking_bar.dart';
import 'data/models/trip_model.dart';
import 'data/services/booking_service.dart';

class SeatSelectionScreen extends StatefulWidget {
  final TripModel trip;

  const SeatSelectionScreen({super.key, required this.trip});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final Set<int> _selectedSeats = {};
  final BookingService _bookingService = BookingService();
  List<int> _reservedSeats = [];
  bool _loadingSeats = true;

  @override
  void initState() {
    super.initState();
    _fetchBookedSeats();
  }

  Future<void> _fetchBookedSeats() async {
    try {
      final booked = await _bookingService.getBookedSeats(widget.trip.id);
      setState(() {
        _reservedSeats = booked;
        _loadingSeats = false;
      });
    } catch (_) {
      setState(() {
        _reservedSeats = [];
        _loadingSeats = false;
      });
    }
  }

  void _toggleSeat(int index) {
    if (index >= widget.trip.totalSeats) return;
    setState(() {
      if (_selectedSeats.contains(index)) {
        _selectedSeats.remove(index);
      } else {
        _selectedSeats.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20), child: SeatsHeader()),
            const SeatsLegend(),
            const VerticalSpace(24),
            Expanded(
              child: _loadingSeats
                  ? const Center(
                      child: CircularProgressIndicator()) // NEW: loading state
                  : BusLayout(
                      selectedSeats: _selectedSeats,
                      reservedSeats:
                          _reservedSeats, // CHANGED: pass dynamic list
                      onSeatToggled: _toggleSeat,
                      totalSeats: widget.trip.totalSeats,
                    ),
            ),
            SeatsBookingBar(
              selectedSeatsCount: _selectedSeats.length,
              trip: widget.trip,
              selectedSeats: _selectedSeats.toList(),
            ),
          ],
        ),
      ),
    );
  }
}
