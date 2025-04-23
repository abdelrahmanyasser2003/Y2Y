import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Widthspace extends StatelessWidget {
  const Widthspace({super.key,required this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
    );
  }
}


class hieghtspace extends StatelessWidget {
  const hieghtspace({super.key, required this.hieght});
  final double? hieght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght?.h,
    );
  }
}