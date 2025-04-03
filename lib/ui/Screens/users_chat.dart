import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/provider/user_chat_provider.dart';
import 'package:y2y/ui/Widges/app_bar_widget.dart';



class UsersChat extends StatelessWidget {
  UsersChat({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userchat = Provider.of<UserChatProvider>(context);

    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/img/pic1.jpg"),
                  radius: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmed Saad",
                      style: TextStyle(
                          fontSize: 20,
                          color: cornflowerblue,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto"),
                    ),
                    Text(
                      "Community Owner / Volunteer",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                          color: cornflowerblue),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_outlined,
                      color: cornflowerblue,
                    )),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: purple, thickness: 1),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: userchat.userchat.length,
                itemBuilder: (context, index) {
                  final userchatt = userchat.userchat[index];
                  return Column(
                    crossAxisAlignment: userchatt.isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: chat,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          userchatt.text,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                              color: cornflowerblue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          userchatt.time,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                              color: cornflowerblue),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: cornflowerblue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: cornflowerblue),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(8.w),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.send, size: 40, color: cornflowerblue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
