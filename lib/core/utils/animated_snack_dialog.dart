import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showAnimatedSnackDialog(
  BuildContext context, {
  String? message,
  AnimatedSnackBarType? type,
}) {
  AnimatedSnackBar.material(
    borderRadius: BorderRadius.circular(10),
    message ?? "",
    type: type ?? AnimatedSnackBarType.success,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
  ).show(context);
}
