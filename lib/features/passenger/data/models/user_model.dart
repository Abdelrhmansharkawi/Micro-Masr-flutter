class UserModel {
  final String id;
  final String fullName;
  final String firstName;
  final String email;
  final String phone;
  final String role;
  final String? profileImage;
  final double rating;
  final double balance;
  final bool isVerified;
  final int unreadNotificationCount;
  final int tripsCount;

  UserModel({
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.role,
    this.profileImage,
    required this.rating,
    required this.balance,
    required this.isVerified,
    required this.unreadNotificationCount,
    required this.tripsCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] as Map<String, dynamic>;

    int _toInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    double _toDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return UserModel(
      id: userData['id'] ?? userData['_id'] ?? '',
      fullName: userData['fullName'] ?? '',
      firstName: userData['firstName'] ??
          (userData['fullName']?.split(' ').first ?? ''),
      email: userData['email'] ?? '',
      phone: userData['phone'] ?? '',
      role: userData['role'] ?? 'user',
      profileImage: userData['profileImage'],
      rating: _toDouble(userData['rating']),
      balance: _toDouble(userData['balance']),
      isVerified: userData['isVerified'] ?? false,
      unreadNotificationCount: _toInt(json['unreadNotificationCount']),
      tripsCount: _toInt(json['tripsCount']),
    );
  }

  factory UserModel.guest() {
    return UserModel(
      id: '',
      fullName: 'زائر',
      firstName: 'زائر',
      email: '',
      phone: '',
      role: 'guest',
      profileImage: null,
      rating: 0.0,
      balance: 0.0,
      isVerified: false,
      unreadNotificationCount: 0,
      tripsCount: 0,
    );
  }


  String get initial => fullName.isNotEmpty ? fullName[0] : '?';
}
