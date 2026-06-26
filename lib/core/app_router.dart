// app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/placeholder_screen.dart';
import 'package:micromasr/features/passenger/language_screen.dart';
import 'package:micromasr/features/splash/splash_screen.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';

// Passenger Imports
import 'package:micromasr/features/passenger/login_screen.dart';
import 'package:micromasr/features/passenger/register_screen.dart';
import 'package:micromasr/features/passenger/otp_screen.dart';
import 'package:micromasr/features/passenger/onboarding_screen.dart';
import 'package:micromasr/features/passenger/passenger_shell.dart';
import 'package:micromasr/features/passenger/home_screen.dart';
import 'package:micromasr/features/passenger/booking_confirm_screen.dart';
import 'package:micromasr/features/passenger/payment_methods_screen.dart';
import 'package:micromasr/features/passenger/payment_success_screen.dart';
import 'package:micromasr/features/passenger/tracking_screen.dart';
import 'package:micromasr/features/passenger/trip_review_screen.dart';
import 'package:micromasr/features/passenger/search_screen.dart';
import 'package:micromasr/features/passenger/rides_screen.dart';
import 'package:micromasr/features/passenger/trip_detail_screen.dart';
import 'package:micromasr/features/passenger/seat_selection_screen.dart';
import 'package:micromasr/features/passenger/notifications_screen.dart';
import 'package:micromasr/features/passenger/passenger_profile_screen.dart';
import 'package:micromasr/features/passenger/personal_info_screen.dart';
import 'package:micromasr/features/passenger/saved_places_screen.dart';
import 'package:micromasr/features/passenger/coupons_screen.dart';
import 'package:micromasr/features/passenger/notification_settings_screen.dart';
import 'package:micromasr/features/passenger/help_center_screen.dart';
import 'package:micromasr/features/passenger/report_problem_screen.dart';
import 'package:micromasr/features/passenger/contact_us_screen.dart';

// Driver Imports
import 'package:micromasr/features/driver/driver_flow_screen.dart';
import 'package:micromasr/features/driver/driver_earnings_screen.dart';
import 'package:micromasr/features/driver/pending_verification_screen.dart';
import 'package:micromasr/features/driver/driver_profile_screen.dart';
import 'package:micromasr/features/driver/register_documents_screen.dart';
import 'package:micromasr/features/driver/register_payout_screen.dart';
import 'package:micromasr/features/driver/register_personal_screen.dart';
import 'package:micromasr/features/driver/register_vehicle_screen.dart';
import 'package:micromasr/features/driver/driver_onboarding_screen.dart';

// Role Toggle
import 'package:micromasr/features/role_toggle/role_toggle_screen.dart';

class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouteConstants.splash,
    routes: [
      GoRoute(
        path: AppRouteConstants.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.toggle,
        builder: (context, state) => const RoleToggleScreen(),
      ),

      // --- Passenger Routes ---
      GoRoute(
        path: AppRouteConstants.passengarOnboarding,
        builder: (context, state) => const PassengerOnboardingScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.passengerLogin,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.passengerRegister,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.passengerOtp,
        builder: (context, state) => const OtpScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            PassengerShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteConstants.passengerHome,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteConstants.passengerRides,
                builder: (context, state) => const RidesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteConstants.passengerNotifications,
                builder: (context, state) => const NotificationsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouteConstants.passengerProfile,
                builder: (context, state) => const PassengerProfileScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.personalInfo,
                builder: (context, state) => const PersonalInfoScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.savedPlaces,
                builder: (context, state) => const SavedPlacesScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.paymentMethods,
                builder: (context, state) => const PaymentMethodsScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.coupons,
                builder: (context, state) => const CouponsScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.notificationSettings,
                builder: (context, state) => const NotificationSettingsScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.helpCenter,
                builder: (context, state) => const HelpCenterScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.reportProblem,
                builder: (context, state) => const ReportProblemScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.contactUs,
                builder: (context, state) => const ContactUsScreen(),
              ),
              GoRoute(
                path: AppRouteConstants.language,
                builder: (context, state) => const LanguageScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: AppRouteConstants.passengerSearch,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.passengerTripDetail,
        builder: (context, state) => TripDetailScreen(),
      ),

      GoRoute(
        path: AppRouteConstants.passengerSeats,
        builder: (context, state) {
          final trip = state.extra as TripModel;
          return SeatSelectionScreen(trip: trip);
        },
      ),

      GoRoute(
        path: AppRouteConstants.passengerBookingConfirm,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return BookingConfirmScreen(
            trip: data['trip'] as TripModel,
            selectedSeats: List<int>.from(data['selectedSeats'] as List),
          );
        },
      ),

      GoRoute(
        path: AppRouteConstants.passengerPayment,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return PaymentMethodsScreen(
            bookingId: data['bookingId'] as String,
            amount: data['amount'] as int,
          );
        },
      ),

      GoRoute(
        path: AppRouteConstants.passengerPaymentSuccess,
        builder: (context, state) {
          final bookingData = state.extra as Map<String, dynamic>;
          return PaymentSuccessScreen(bookingData: bookingData);
        },
      ),
      GoRoute(
        path: AppRouteConstants.passengerTracking,
        builder: (context, state) {
          final tripId = state.pathParameters['tripId']!;
          return TrackingScreen(tripId: tripId);
        },
      ),
      GoRoute(
        path: '${AppRouteConstants.passengerReview}/:tripId',
        name: 'passengerReview',
        builder: (context, state) {
          final tripId = state.pathParameters['tripId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return TripReviewScreen(
            tripId: tripId,
            driverName: extra?['driverName'] ?? '',
            vehicleInfo: extra?['vehicleInfo'] ?? '',
            totalPrice: (extra?['totalPrice'] as num?)?.toDouble() ?? 0,
            bookingId: extra?['bookingId'] ?? '',
            tripDistance: extra?['tripDistance'] as String, 
      durationMinutes: extra?['durationMinutes'] as int ,
          );
        },
      ),

      // --- Driver Routes  ---
      GoRoute(
        path: AppRouteConstants.driverOnboarding,
        builder: (context, state) => const DriverOnboardingScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverLogin,
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Driver Login'),
      ),
      GoRoute(
        path: AppRouteConstants.driverOtp,
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Driver OTP'),
      ),
      GoRoute(
        path: AppRouteConstants.driverRegisterPersonal,
        builder: (context, state) => const RegisterPersonalScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverRegisterVehicle,
        builder: (context, state) => const RegisterVehicleScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverRegisterDocuments,
        builder: (context, state) => const RegisterDocumentsScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverRegisterPayment,
        builder: (context, state) => const RegisterPayoutScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverPending,
        builder: (context, state) => const PendingVerificationScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverHome,
        builder: (context, state) => const DriverFlowScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverEarnings,
        builder: (context, state) => const DriverEarningsScreen(),
      ),
      GoRoute(
        path: AppRouteConstants.driverProfile,
        builder: (context, state) => const DriverProfileScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          '${AppStrings.genericError}: ${state.error}',
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
