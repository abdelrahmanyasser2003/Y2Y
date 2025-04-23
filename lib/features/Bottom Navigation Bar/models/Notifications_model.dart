class NotificationItem {
  final String title;
  final String subtitle;
  final String time;
  final dynamic imageUrl;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.imageUrl,
    this.isRead = false,
  });
}
