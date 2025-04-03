import 'package:flutter/material.dart';
import 'package:y2y/core/app_colors.dart';


class ChipWidgt extends StatelessWidget {
  ChipWidgt(
      {super.key,
      required this.value,
      required this.onSelected,
      required this.text,
      required this.selected});
  bool? value;
  bool selected = false;
  String text;
  void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      side: BorderSide(color: white),
      avatar: Checkbox(
        side: BorderSide(color: white),
        fillColor: WidgetStatePropertyAll(cornflowerblue),
        value: value,
        onChanged: (value) {},
      ),
      onSelected: onSelected,
      checkmarkColor: white,
      selected: selected,
      label: Text(
        text,
        style: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.w800,
        ),
      ),
      labelStyle: TextStyle(color: white),
      color: WidgetStatePropertyAll(cornflowerblue),
    );
  }
}
