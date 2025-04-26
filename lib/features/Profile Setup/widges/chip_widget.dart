import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ChipWidgt extends StatelessWidget {
  const ChipWidgt(
      {super.key,
      required this.value,
      required this.onSelected,
      required this.text,
       this.selected});
  final bool? value;
  final bool? selected;
  final String text;
  final void Function(bool)? onSelected;

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
      selected: selected??false,
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
