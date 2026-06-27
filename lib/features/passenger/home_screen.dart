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

      bool isLoggedIn = await AuthStateService.isLoggedIn();

      if (!isLoggedIn) {
        UserModel guestUser = UserModel.guest();
        List<TripModel> trips = [];
        try {
          trips = await _tripService.getNearbyTrips(30.0444, 31.2357);
        } catch (_) {
        }
        if (!mounted) return;
        setState(() {
          _user = guestUser;
          _trips = trips;
          _isLoading = false;
        });
        return;
      }

      final results = await Future.wait([
        _userService.getMe(),
        _tripService.getNearbyTrips(30.0444, 31.2357),
      ]);

      if (!mounted) return;
      setState(() {
        _user = results[0] as UserModel;
        _trips = results[1] as List<TripModel>;
        _isLoading = false;
      });
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        UserModel guestUser = UserModel.guest();
        List<TripModel> trips = [];
        try {
          trips = await _tripService.getNearbyTrips(30.0444, 31.2357);
        } catch (_) {}
        if (!mounted) return;
        setState(() {
          _user = guestUser;
          _trips = trips;
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
            userLat: 30.0444, 
            userLng: 31.2357,
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
