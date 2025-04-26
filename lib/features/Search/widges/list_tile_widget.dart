import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, required this.title,this.subTitle});
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: white),
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
        subtitle: Text(
          subTitle??'',
          style: TextStyle(
              color: cornflowerblue,
              fontSize: 9,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
