import 'package:flutter/material.dart';
import 'package:y2y/features/user/models/user_chat_model.dart';


class UserChatProvider extends ChangeNotifier {
  List<UserChat> userchat = [
    UserChat(
        isMe: true,
        text:
            "Hi Fady, Great to connect with you in the Innovators community! I'm excited to share my knowledge and learn from your experiences in AI and data science. Looking forward to collaborating and exchanging ideas.",
        time: "Today at 1:50 pm"),
    UserChat(
        isMe: false,
        text:
            "Hello Ahmed, Thank you for reaching out! I'm also excited to be part of this community and eager to share my skills and learn from everyone here. Let's make the most of this opportunity to grow together.",
        time: "Today at 3:48 pm"),
    UserChat(
        isMe: true,
        text:
            "Absolutely, Fadi! Let's dive into discussions and projects that will help us all grow. I'm sure we can achieve great things together in this community. Best,",
        time: "Today at 7:12 pm")
  ];
  void addMessage(String text) {
    userchat.add(UserChat(text: text, time: "Now", isMe: true));
    notifyListeners();
  }
}
