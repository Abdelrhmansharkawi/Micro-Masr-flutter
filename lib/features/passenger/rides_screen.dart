import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/services/location_service.dart';
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
  final TextEditingController _searchController = TextEditingController();

  List<TripModel> _allTrips = [];
  List<TripModel> _filteredTrips = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.searchQuery != null) {
      _searchController.text = widget.searchQuery!;
    }
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
      if (widget.searchQuery != null) {
        _searchController.text = widget.searchQuery!;
      }
      _loadTrips();
    }
  }

  Future<void> _loadTrips() async {
    try {
      final location = await LocationService.getLocationOrDefault();
      // Using the 500km radius so trips actually appear regardless of test location
      final trips = await _tripService.getNearbyTrips(
        location.latitude,
        location.longitude,
        distance: 500,
      );

      if (mounted) {
        setState(() {
          _allTrips = trips;
          _loading = false;
        });
        // Apply initial search filter if a query was passed
        _filterTrips(_searchController.text);
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

  void _filterTrips(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        _filteredTrips = _allTrips;
      } else {
        final lowerQuery = query.trim().toLowerCase();
        _filteredTrips = _allTrips.where((trip) {
          // Check Start Location
          final matchStart =
              trip.startLocation.name?.toLowerCase().contains(lowerQuery) ??
                  false;
          // Check End Location
          final matchEnd =
              trip.endLocation.name?.toLowerCase().contains(lowerQuery) ??
                  false;
          // Check any stop in the stops list
          final matchStops =
              trip.stops.any((s) => s.toLowerCase().contains(lowerQuery));

          return matchStart || matchEnd || matchStops;
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            _buildSearchBar(context),
            const VerticalSpace(16),
            const RidesFilter(), // Your original filter row is restored here!
            const VerticalSpace(12),
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.aw),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.aw),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: context.colors.primary, size: 24.aw),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onChanged: _filterTrips,
                decoration: InputDecoration(
                  hintText: AppStrings.whereToToday,
                  hintStyle: context.bodyLargeTextStyle.copyWith(
                    color: context.colors.textSecondary,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.ah),
                ),
                style: context.bodyLargeTextStyle.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
            if (_searchController.text.isNotEmpty)
              GestureDetector(
                onTap: () {
                  _searchController.clear();
                  _filterTrips('');
                  FocusScope.of(context).unfocus(); // Close keyboard
                },
                child: Icon(Icons.clear,
                    color: context.colors.textSecondary, size: 20.aw),
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
    if (_filteredTrips.isEmpty) {
      return const Center(child: Text('No available rides match your search'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: _filteredTrips.length,
      separatorBuilder: (_, __) => const VerticalSpace(16),
      itemBuilder: (context, index) {
        return RideCard(trip: _filteredTrips[index]);
      },
    );
  }
}
