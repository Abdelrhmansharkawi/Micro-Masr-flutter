class NotificationModel {
  final String id;
  final String title;
  final String body;
  final bool isRead;
  final String type;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.type,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'],
      title: json['title'],
      body: json['body'] ?? '',
      isRead: json['isRead'] ?? false,
      type: json['type'] ?? 'system',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
