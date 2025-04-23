import 'package:flutter/material.dart';

class MessageCard {
  String name;
  String message;
  String time;
  dynamic imageUrl;
  bool isNew;
  String? selectedAction;
  IconData? selectedIcon;

  MessageCard({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.isNew,
    this.selectedAction,
    this.selectedIcon,
  });
}

