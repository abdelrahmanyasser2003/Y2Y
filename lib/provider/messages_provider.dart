import 'package:flutter/material.dart';
import 'package:y2y/model/messages_model.dart';

class MessagesProvider extends ChangeNotifier {
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
}
