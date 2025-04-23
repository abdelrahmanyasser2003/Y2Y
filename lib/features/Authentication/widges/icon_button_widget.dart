import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_forward_ios,
          color: white,
        ));
  }
}
