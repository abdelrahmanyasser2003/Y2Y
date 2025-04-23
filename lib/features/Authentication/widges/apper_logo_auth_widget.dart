import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApperLogoAuthWidget extends StatelessWidget {
  const ApperLogoAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/img/ytylogo.png",
      width: 150.w,
      height: 150.h,
    );
  }
}
