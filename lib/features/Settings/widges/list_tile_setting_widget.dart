import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ListTileSettingWidget extends StatelessWidget {
  const ListTileSettingWidget(
      {super.key,
      this.onTap,
      this.fontSize,
      required this.title,
      required this.icon,
      required this.subTitle,
      required this.backgroundColor,
      this.trailing});
  final String title;
  final String subTitle;
  final IconData icon;
  final double? fontSize;
  final Widget? trailing;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white),
        child: ListTile(
          trailing: trailing,
          title: Text(
            title,
            style: TextStyle(
                color: cornflowerblue,
                fontSize: fontSize ?? 17,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
                color: cornflowerblue,
                fontSize: 9,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w100),
          ),
          leading: CircleAvatar(
            backgroundColor: backgroundColor,
            child: Icon(icon, color: white),
          ),
        ),
      ),
    );
  }
}

class ListTileSettingWidgett extends StatelessWidget {
  const ListTileSettingWidgett({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white),
        child: ListTile(
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: cornflowerblue,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: cornflowerblue,
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
