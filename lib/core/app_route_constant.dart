class AppRouteConstants {
  static const String splash = '/splash';
  static const String toggle = '/toggle';
  static const String passengarOnboarding = '/onboarding';

  // Auth
  static const String passengerLogin = '/auth/login';
  static const String passengerRegister = '/auth/register';
  static const String passengerOtp = '/auth/otp';

  // Passenger
  static const String passengerHome = '/passenger/home';
  static const String passengerSearch = '/passenger/search';
  static const String passengerRides = '/passenger/rides';
  static const String passengerTripDetail = '/passenger/rides/detail';
  static const String passengerSeats = '/passenger/seats';
  static const String passengerBookingConfirm = '/passenger/booking/confirm';
  static const String passengerPayment = '/passenger/booking/payment';
  static const String passengerPaymentSuccess = '/passenger/booking/success';
  static const String passengerTracking = '/tracking/:tripId';
  static const String passengerReview = '/passenger/review';

  static const String passengerHistory = '/passenger/history';
  static const String passengerNotifications = '/passenger/notifications';
  static const String passengerProfile = '/passenger/profile';
  static const String personalInfo = '/passenger/profile/personal-info';
  static const String savedPlaces = '/passenger/profile/saved-places';
  static const String paymentMethods = '/passenger/profile/payment-methods';
  static const String coupons = '/passenger/profile/coupons';
  static const String notificationSettings =
      '/passenger/profile/notification-settings';
  static const String helpCenter = '/passenger/profile/help-center';
  static const String reportProblem = '/passenger/profile/report-problem';
  static const String contactUs = '/passenger/profile/contact-us';
  static const String language = '/passenger/profile/language';

  // Driver
  static const String driverLogin = '/driver/login';
  static const String driverRegister = '/driver/register';
  static const String driverOtp = '/driver/otp';
  static const String driverOnboarding = '/driver/onboarding';
  static const String driverRegisterPersonal = '/driver/register/personal';
  static const String driverRegisterVehicle = '/driver/register/vehicle';
  static const String driverRegisterDocuments = '/driver/register/documents';
  static const String driverRegisterPayment = '/driver/register/payment';
  static const String driverPending = '/driver/pending';
  static const String driverHome = '/driver/home';
  static const String driverActiveTrip = '/driver/trip';
  static const String driverEarnings = '/driver/earnings';
  static const String driverProfile = '/driver/profile';
}
