import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/provider/messages_provider.dart';

class Messagepage extends StatefulWidget {
  const Messagepage({super.key});

  @override
  State<Messagepage> createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
  bool isSelectionMode = false;
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    final message = Provider.of<MessagesProvider>(context, listen: false);
    selectedItems =
        List.generate(message.messageslist.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final message = Provider.of<MessagesProvider>(context);

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: AnimatedPadding(
        duration: Duration(milliseconds: 300),
        padding: isSelectionMode
            ? EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h)
            : EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Messages",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                  ),
                ),
                if (isSelectionMode)
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset("assets/img/mute-notification.png"),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset("assets/img/user-block.png"),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset("assets/img/Delete.png"),
                        onPressed: () {
                          setState(() {
                            for (int i = selectedItems.length - 1;
                                i >= 0;
                                i--) {
                              if (selectedItems[i]) {
                                message.messageslist.removeAt(i);
                              }
                            }
                            selectedItems = List.generate(
                                message.messageslist.length, (index) => false);
                            if (message.messageslist.isEmpty) {
                              isSelectionMode = false;
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: white,
                          size: 30.sp,
                        ),
                        onPressed: () {
                          setState(() {
                            isSelectionMode = false;
                            selectedItems = List.generate(
                                message.messageslist.length, (index) => false);
                          });
                        },
                      ),
                    ],
                  )
                else
                  PopupMenuButton<String>(
                    iconColor: white,
                    color: white,
                    onSelected: (value) {
                      if (value == "Mark all as Read") {
                        message.markAllAsReadMessages();
                      } else {
                        setState(() {
                          isSelectionMode = true;
                        });
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: "Mark all as Read",
                        child: Text(
                          "Mark all as Read",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Delete Chats",
                        child: Text(
                          "Delete Chats",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Report a problem",
                        child: Text(
                          "Report a problem",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Block users",
                        child: Text(
                          "Block users",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            hieghtspace(hieght: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final messags = message.messageslist[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        message.markAsReadMessages(index);
                      });
                    },
                    child: Row(
                      children: [
                        if (isSelectionMode)
                          IconButton(
                            icon: Icon(
                              selectedItems[index]
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: white,
                              size: 30.sp,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedItems[index] = !selectedItems[index];
                              });
                            },
                          ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.h, right: 5.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (!messags.isNew)
                                        Icon(
                                          Icons.circle,
                                          size: 10.r,
                                          color: Colors.red,
                                        ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  isThreeLine: true,
                                  leading: _buildLeading(messags.imageUrl),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        messags.name,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: cornflowerblue,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                      Text(
                                        messags.time,
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          color: cornflowerblue,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    messags.message,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: cornflowerblue,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Text(""),
                itemCount: message.messageslist.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLeading(dynamic image) {
  if (image is String) {
    if (image.startsWith("http")) {
      return CircleAvatar(backgroundImage: NetworkImage(image), radius: 25.r);
    } else {
      return CircleAvatar(backgroundImage: AssetImage(image), radius: 25.r);
    }
  } else if (image is IconData) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(color: cornflowerblue, shape: BoxShape.circle),
      child: Icon(image, size: 30.r, color: white),
    );
  } else {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 25.r,
      child: Icon(Icons.error, color: Colors.white),
    );
  }
}
