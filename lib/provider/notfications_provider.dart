import 'package:flutter/material.dart';
import 'package:y2y/model/Notifications_model.dart';

class NotficationsProvider extends ChangeNotifier{
    List<NotificationItem> notifications = [
    NotificationItem(
      title: "From Ahmed Saad",
      subtitle: "Mark your Opportunity as trusted and 42 people more.",
      time: "24m ago",
      imageUrl: "assets/img/pic1.jpg",
      isRead: false,
    ),
    NotificationItem(
      title: "From Admin",
      subtitle:
          "Great news! Your opportunity “Flutter Summer Internship” has been approved and is now live in the opportunity section",
      time: "1h ago",
      imageUrl: Icons.verified,
      isRead: false,
    ),
    NotificationItem(
      title: "From Admin",
      subtitle:
          "Unfortunately, Your opportunity “Backed-End Developer Job” did not meet our guidelines and has been rejected.",
      time: "1 week ago",
      imageUrl: Icons.cancel,
      isRead: false,
    ),
    NotificationItem(
      title: "New Message From\nFady Adel",
      subtitle:
          "“ Hello my friend, how are you today ?! I hope everything is great with you”",
      time: "3 weeks ago",
      imageUrl: "assets/img/pic2.jpg",
      isRead: false,
    ),
  ];

  void markAsRead(int index) {
    notifications[index].isRead = true;
    notifyListeners();
  }

  void markAllAsRead() {
    for (var notification in notifications) {
      notification.isRead = true;
    }
    notifyListeners();
  }
}