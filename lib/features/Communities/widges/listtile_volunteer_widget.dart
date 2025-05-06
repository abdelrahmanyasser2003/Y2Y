import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ListtileVolunteerWidget extends StatelessWidget {
  const ListtileVolunteerWidget(
      {super.key,
      required this.title,
      required this.onTap,
      required this.backgroundImage});
  final String title;
  final ImageProvider<Object>? backgroundImage;

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
          title: Text(
            title,
            style: TextStyle(
                color: cornflowerblue,
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            'Volunteer (Admin)',
            style: TextStyle(
                color: cornflowerblue,
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400),
          ),
          leading: CircleAvatar(
            backgroundImage: backgroundImage,
            radius: 30,
          ),
        ),
      ),
    );
  }
}
