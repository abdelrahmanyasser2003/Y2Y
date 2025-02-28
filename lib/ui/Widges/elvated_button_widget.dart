import 'package:flutter/material.dart';

class ElvatedButtonWidget extends StatelessWidget {
  ElvatedButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor,
      required this.color});
  final String text;
  final void Function()? onPressed;
  final WidgetStateProperty<Color?>? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(5),
        shadowColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: backgroundColor,
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 19,
            color: color,
            fontFamily: "Poppins"),
      ),
    );
  }
}
