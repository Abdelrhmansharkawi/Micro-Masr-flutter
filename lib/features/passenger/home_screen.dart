import 'package:flutter/material.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'home_header.dart';
import 'home_map.dart';
import 'home_search_bar.dart';
import 'nearby_stations_sheet.dart';
import 'data/services/user_service.dart';
import 'data/services/trip_service.dart';
import 'data/models/user_model.dart';
import 'data/models/trip_model.dart';
import 'package:micromasr/core/services/auth_state_service.dart';
import 'package:micromasr/core/services/location_service.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserService _userService = UserService();
  final TripService _tripService = TripService();

  UserModel? _user;
  List<TripModel> _trips = [];
  bool _isLoading = true;
  String? _error;
  double? _userLat;
  double? _userLng;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final location = await LocationService.getLocationOrDefault();
      final lat = location.latitude;
      final lng = location.longitude;

      bool isLoggedIn = await AuthStateService.isLoggedIn();

      if (!isLoggedIn) {
        UserModel guestUser = UserModel.guest();
        List<TripModel> trips = [];
        try {
          trips = await _tripService.getNearbyTrips(lat, lng);
        } catch (_) {
        }
        if (!mounted) return;
        setState(() {
          _user = guestUser;
          _trips = trips;
          _userLat = lat;
          _userLng = lng;
          _isLoading = false;
        });
        return;
      }

      final results = await Future.wait([
        _userService.getMe(),
        _tripService.getNearbyTrips(lat, lng),
      ]);

      if (!mounted) return;
      setState(() {
        _user = results[0] as UserModel;
        _trips = results[1] as List<TripModel>;
        _userLat = lat;
        _userLng = lng;
        _isLoading = false;
      });
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        UserModel guestUser = UserModel.guest();
        List<TripModel> trips = [];
        final location = await LocationService.getLocationOrDefault();
        try {
          trips = await _tripService.getNearbyTrips(
            location.latitude,
            location.longitude,
          );
        } catch (_) {}
        if (!mounted) return;
        setState(() {
          _user = guestUser;
          _trips = trips;
          _userLat = location.latitude;
          _userLng = location.longitude;
          _isLoading = false;
          _error = null;
        });
      } else {
        if (!mounted) return;
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_error != null) {
      return Scaffold(body: Center(child: Text('Error: $_error')));
    }

    final user = _user!;
    return Scaffold(
      body: Stack(
        children: [
          HomeMap(
            trips: _trips,
            userLat: _userLat,
            userLng: _userLng,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  VerticalSpace(16),
                  HomeHeader(
                    userName: user.firstName,
                    notificationCount: user.unreadNotificationCount,
                  ),
                  VerticalSpace(16),
                  HomeSearchBar(),
                ],
              ),
            ),
          ),
          NearbyStationsSheet(trips: _trips),
        ],
      ),
    );
  }
}
