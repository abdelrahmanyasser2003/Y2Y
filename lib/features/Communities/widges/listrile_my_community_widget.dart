import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';

class ListrileMyCommunityWidget extends StatelessWidget {
  const ListrileMyCommunityWidget(
      {super.key,
      required this.title,
      required this.backgroundImage,
      required this.chexkOnTap,
      required this.onTap,
      required this.cancelOnTap});
  final String title;
  final void Function()? onTap;

  final ImageProvider<Object>? backgroundImage;
  final void Function()? chexkOnTap;
  final void Function()? cancelOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
        child: ListTile(
          trailing: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: chexkOnTap,
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                ),
                GestureDetector(
                    onTap: cancelOnTap,
                    child: Icon(Icons.cancel_outlined, color: Colors.red)),
              ],
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: cornflowerblue,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
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
