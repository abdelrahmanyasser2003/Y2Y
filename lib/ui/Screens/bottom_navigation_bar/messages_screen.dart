import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/provider/project.dart';
import 'package:y2y/ui/widges/app_Bar_Widget.dart';
import 'package:y2y/ui/widges/colors.dart';

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
    final message = Provider.of<Project>(context, listen: false);
    selectedItems =
        List.generate(message.messageslist.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final message = Provider.of<Project>(context);

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget()),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 7, right: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Messages",
                  style: TextStyle(
                      fontSize: 30,
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat"),
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
                          size: 30,
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
                              fontSize: 15,
                              color: cornflowerblue,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Delete Chats",
                        child: Text(
                          "Delete Chats",
                          style: TextStyle(
                              fontSize: 15,
                              color: cornflowerblue,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Report a problem",
                        child: Text(
                          "Report a problem",
                          style: TextStyle(
                              fontSize: 15,
                              color: cornflowerblue,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Block users",
                        child: Text(
                          "Block users",
                          style: TextStyle(
                              fontSize: 15,
                              color: cornflowerblue,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
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
                              color: selectedItems[index] ? white : white,
                              size: 30,
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
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (!messags.isNew)
                                        const Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.red,
                                        )
                                    ],
                                  ),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  isThreeLine: true,
                                  leading: _buildLeading(messags.imageUrl),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        messags.name,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cornflowerblue,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Montserrat"),
                                      ),
                                      Text(
                                        messags.time,
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: cornflowerblue,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto"),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    messags.message,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto"),
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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
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
      return CircleAvatar(backgroundImage: NetworkImage(image), radius: 25);
    } else {
      return CircleAvatar(backgroundImage: AssetImage(image), radius: 25);
    }
  } else if (image is IconData) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: cornflowerblue, shape: BoxShape.circle),
      child: Icon(image, size: 40, color: white),
    );
  } else {
    return CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 25,
        child: Icon(Icons.error, color: Colors.white));
  }
}
