import 'package:flutter/material.dart';

import 'package:y2y/model/Notifications_model.dart';
import 'package:y2y/model/messages_model.dart';

import 'package:y2y/model/opportunitys_model.dart';
import 'package:y2y/model/user_detils_model.dart';

class Project extends ChangeNotifier {
//new opportunity
  final List<opportunitydetilsmodel> _opportunitydeyils = [];
  List<opportunitydetilsmodel> get opportunities => _opportunitydeyils;

  void addopportunity(opportunitydetilsmodel opportunity) {
    _opportunitydeyils.add(opportunity);
    notifyListeners();
  }

// --------------------------------------------------------------------------------
//notfications
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
// -------------------------------------------------------
//messages

  List<MessageCard> messageslist = [
    MessageCard(
        name: "Ahmed Saad",
        message:
            "We will meet today with the team to talk about our new project, Are you coming ?",
        time: "1d ago",
        imageUrl: "assets/img/pic1.jpg",
        isNew: false),
    MessageCard(
        name: "Admin",
        message:
            "Congratulations! you have been approved to join “Tech Innovators” Community. You can now share your interests with others.",
        time: "3d ago",
        imageUrl: Icons.person_pin,
        isNew: false),
    MessageCard(
        name: "Salma Hany",
        message:
            "I have added you to the community group on WhatsApp and I will also send you the schedule tonight.",
        time: "1 month ago",
        imageUrl: "assets/img/pic3.jpg",
        isNew: false),
    MessageCard(
        name: "Shady Salama",
        message:
            "I have added you to the community group on WhatsApp and I will also send you the schedule tonight.",
        time: "13 month ago",
        imageUrl: "assets/img/pic4.jpg",
        isNew: true),
    MessageCard(
        name: "Fady Adel",
        message:
            "Hello my friend, how are you today ?! I hope everything is great with you",
        time: "2y ago",
        imageUrl: "assets/img/pic2.jpg",
        isNew: true)
  ];
  void markAsReadMessages(int index) {
    messageslist[index].isNew = true;
    notifyListeners();
  }

  void markAllAsReadMessages() {
    for (var messagess in messageslist) {
      messagess.isNew = true;
    }
    notifyListeners();
  }

  void setMessageAction(int index, String action, IconData icon) {
    messageslist[index].selectedAction = action;
    messageslist[index].selectedIcon = icon;
    notifyListeners();
  }

// -------------------------------------------------------
  final List<UserDetilsModel> _userdetils = [];
  List<UserDetilsModel> get userdetils => _userdetils;

  void addUserDetils(UserDetilsModel userdetils) {
    _userdetils.add(userdetils);
    notifyListeners();
  }

//--------------------------------------------------------
// verify email
  String _email = '';
  String get email => _email;
  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}
