import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_styles.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    this.width,
    this.height,
    this.colors,
    this.controller,
    this.onChanged,
    this.hintText,
    this.validator,
    this.suffixIcon,
    this.colorBord,
    this.obscureText,
    this.keyboardType,
    this.maxLength,
    this.onTap,
    this.maxLines,
    this.readOnly,
    this.fillColor,
    this.textInputAction,
  });
  final String? hintText;
  final Color? fillColor;
  final Color? colorBord;
  final double? width;
  final double? height;
  final Color? colors;
  bool? readOnly = false;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 40.h,
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText ?? false,
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        style: TextStyle(color: colors ?? Colors.black),
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyles().lato16w600style,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: colorBord ?? Colors.grey,
            ),
          ),
          filled: true,
          fillColor: fillColor ?? Colors.white,
          contentPadding: EdgeInsets.all(8.w),
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.black,
        ),
        readOnly: readOnly ?? false,
        maxLength: maxLength,
        maxLines: obscureText == true ? 1 : maxLines,
      ),
    );
  }
}
