import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/provider/project.dart';
import 'package:y2y/ui/widges/app_Bar_Widget.dart';
import 'package:y2y/ui/widges/colors.dart';



class Notificationspage extends StatefulWidget {
  const Notificationspage({super.key});

  @override
  State<Notificationspage> createState() => _NotificationspageState();
}

class _NotificationspageState extends State<Notificationspage> {
  @override
  Widget build(BuildContext context) {
    final notificationn = Provider.of<Project>(context);
    bool hasUnreadNotifications =
        notificationn.notifications.any((n) => !n.isRead);
    return Scaffold(
        backgroundColor: cornflowerblue,
        appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarWidget()),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                        fontSize: 30,
                        color: white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat"),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          notificationn.markAllAsRead();
                        });
                      },
                      icon: Image.asset(
                        "assets/img/solar_check-read-selected.png",
                        color: hasUnreadNotifications ? purple : white,
                      ))
                ],
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final notification = notificationn.notifications[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              notificationn.markAsRead(index);
                            });
                          },
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
                                      if (!notification.isRead)
                                        const Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.red,
                                        )
                                    ],
                                  ),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  isThreeLine: true,
                                  leading: _buildLeading(notification.imageUrl),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        notification.title,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cornflowerblue,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Montserrat"),
                                      ),
                                      Text(
                                        notification.time,
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
                                    notification.subtitle,
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
                        );
                      },
                      separatorBuilder: (context, index) => Text(""),
                      itemCount: notificationn.notifications.length))
            ],
          ),
        ));
  }
}

Widget _buildLeading(dynamic image) {
  if (image is String) {
    if (image.startsWith("http")) {
      return CircleAvatar(
        backgroundImage: NetworkImage(image),
        radius: 25,
      );
    } else {
      return CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 25,
      );
    }
  } else if (image is IconData) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: cornflowerblue,
        shape: BoxShape.circle,
      ),
      child: Icon(image, size: 30, color: white),
    );
  } else {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 25,
      child: Icon(Icons.error, color: Colors.white),
    );
  }
}
