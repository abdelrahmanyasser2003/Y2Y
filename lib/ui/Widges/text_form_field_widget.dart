import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.hintText,
      required this.validator,
      required this.suffixIcon,
      required this.obscureText,
      required this.keyboardType,
      required this.maxLength,
      required this.maxLines,
      required this.textInputAction});
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;

  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black),
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontFamily: "Lato", color: Colors.grey, fontSize: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.black,
      ),
      maxLength: maxLength,
      maxLines: obscureText == true ? 1 : maxLines,
    );
  }
}
