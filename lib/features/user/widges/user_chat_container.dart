import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';



class UserChatContainer extends StatelessWidget {
  const UserChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 280,
          height: 138,
          decoration:
              BoxDecoration(color: chat, borderRadius: BorderRadius.circular(10)),
          child: Text(
            "Hi Fady,\nGreat to connect with you in the Innovators community! I'm excited to share my knowledge and learn from your experiences in AI and data science. Looking forward to collaborating and exchanging ideas.",
            style: TextStyle(
                fontSize: 13,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                color: cornflowerblue),
          ),
        ),
      ],
    );
  }
}
