import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'rides_header.dart';
import 'rides_filter.dart';
import 'ride_card.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';
import 'package:micromasr/features/passenger/data/services/trip_service.dart';

class RidesScreen extends StatefulWidget {
  final String? searchQuery;
  const RidesScreen({super.key, this.searchQuery});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  final TripService _tripService = TripService();
  List<TripModel> _trips = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  @override
  void didUpdateWidget(covariant RidesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      setState(() {
        _loading = true;
        _error = null;
      });
      _loadTrips();
    }
  }

  Future<void> _loadTrips() async {
    try {
      final trips = await _tripService.searchTrips(
        from: '',
        to: widget.searchQuery ?? '',
        date: DateTime.now(),
      );
      if (mounted) {
        setState(() {
          _trips = trips;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to load trips';
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: RidesHeader(),
            ),
            const RidesFilter(),
            const VerticalSpace(12),
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Text(_error!, style: const TextStyle(color: Colors.red)),
      );
    }
    if (_trips.isEmpty) {
      return const Center(child: Text('No available rides'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemBuilder: (context, index) => RideCard(trip: _trips[index]),
      separatorBuilder: (context, index) => const VerticalSpace(16),
      itemCount: _trips.length,
    );
  }
}
