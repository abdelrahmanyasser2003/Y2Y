import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/provider/notfications_provider.dart';


class Notificationspage extends StatefulWidget {
  const Notificationspage({super.key});

  @override
  State<Notificationspage> createState() => _NotificationspageState();
}

class _NotificationspageState extends State<Notificationspage> {
  @override
  Widget build(BuildContext context) {
    final notificationn = Provider.of<NotficationsProvider>(context);
    bool hasUnreadNotifications =
        notificationn.notifications.any((n) => !n.isRead);

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                  ),
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
                  ),
                ),
              ],
            ),
            hieghtspace(hieght: 10),
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
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.h, right: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (!notification.isRead)
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
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            isThreeLine: true,
                            leading: _buildLeading(notification.imageUrl),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  notification.title,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  notification.time,
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
                              notification.subtitle,
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
                  );
                },
                separatorBuilder: (context, index) => const Text(''),
                itemCount: notificationn.notifications.length,
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
      return CircleAvatar(
        backgroundImage: NetworkImage(image),
        radius: 25.r,
      );
    } else {
      return CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 25.r,
      );
    }
  } else if (image is IconData) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: cornflowerblue,
        shape: BoxShape.circle,
      ),
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
