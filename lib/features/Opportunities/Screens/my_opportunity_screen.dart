import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';
import 'package:y2y/features/Opportunities/provider/delete_opportunity_provider.dart';

class MyOpportunityScreen extends StatefulWidget {
  const MyOpportunityScreen({super.key, required this.myOpportunity});
  final GetAllOpportunities myOpportunity;

  @override
  State<MyOpportunityScreen> createState() => _MyOpportunityScreenState();
}

class _MyOpportunityScreenState extends State<MyOpportunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget()),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: cornflowerblue,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: widget.myOpportunity.image != null
                            ? NetworkImage(
                                '${ApiEndpoints.baseUrl}${widget.myOpportunity.image!.replaceAll('\\', '/')}',
                              )
                            : AssetImage('assets/img/default.png')
                                as ImageProvider,
                        backgroundColor: Colors.grey[200],
                      ),
                      Widthspace(width: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.myOpportunity.title ?? '',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: cornflowerblue,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "at ${widget.myOpportunity.company}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: cornflowerblue,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ]),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Divider(
                    color: purple,
                    thickness: 0.8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Posted at : ${DateFormat('hh:mma E dd/MM/yyyy').format(widget.myOpportunity.createdAt!.toLocal())}",
                        style: TextStyle(
                          fontSize: 10,
                          color: cornflowerblue,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                      Widthspace(width: 15),
                      Text(
                        "Published by : ${widget.myOpportunity.createdBy?.userName}",
                        style: TextStyle(
                          fontSize: 10,
                          color: cornflowerblue,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Company:",
                        style: TextStyle(
                            fontSize: 14,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.myOpportunity.company ?? "",
                        style: TextStyle(
                            fontSize: 13,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Description:",
                    style: TextStyle(
                        fontSize: 14,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.myOpportunity.description ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Responsibilities::",
                    style: TextStyle(
                        fontSize: 14,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  Text(
                    widget.myOpportunity.responsibilities ?? "",
                    style: TextStyle(
                        fontSize: 13,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Requirements:",
                    style: TextStyle(
                        fontSize: 14,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto"),
                  ),
                  Text(
                    widget.myOpportunity.requirements ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Duration:",
                        style: TextStyle(
                            fontSize: 14,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.myOpportunity.duration ?? '',
                        style: TextStyle(
                            fontSize: 13,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Application Deadline:",
                        style: TextStyle(
                            fontSize: 14,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        DateFormat('MMMM d, yyyy')
                            .format(widget.myOpportunity.deadline!.toLocal()),
                        style: TextStyle(
                          fontSize: 13,
                          color: cornflowerblue,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 220,
                          height: 48,
                          child: ElvatedButtonWidget(
                            text: 'Apply',
                            onPressed: () async {
                              final Uri url = Uri.parse(
                                  widget.myOpportunity.link ??
                                      ''); // تأكد من تحويل الرابط إلى Uri
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url); // فتح الرابط
                              } else {
                                print('لم يتمكن من فتح الرابط');
                              }
                            },
                            color: white,
                            backgroundColor: WidgetStatePropertyAll(green),
                          )),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0), // يمنع المساحة الزايدة
                            backgroundColor: Color(0xffB3D7ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            shadowColor: Colors.black,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/img/Vector.png',
                              width: 22, // عدل الحجم حسب ما تحب
                              height: 22,
                              fit: BoxFit.contain,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: cornflowerblue,
                                  title: Text(
                                    'Confirm Deletion',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Roboto',
                                        fontSize: 23),
                                  ),
                                  content: Text(
                                    'Are you sure you want to delete this opportunity ?',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Roboto',
                                        fontSize: 16),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('Cancel',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Roboto')),
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // إغلاق الـ Dialog
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Delete',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Roboto')),
                                      onPressed: () async {
                                        Navigator.pop(
                                            context); // إغلاق الـ Dialog قبل الحذف

                                        final opportunityDeleteProvider =
                                            Provider.of<
                                                    OpportunityDeleteProvider>(
                                                context,
                                                listen: false);

                                        String opportunityId =
                                            widget.myOpportunity.id ?? "";

                                        await opportunityDeleteProvider
                                            .deleteOpportunity(opportunityId);

                                        if (opportunityDeleteProvider
                                            .isDeleted) {
                                          showAnimatedSnackDialog(
                                            context,
                                            message:
                                                'opportunity deleted successfully.',
                                            type: AnimatedSnackBarType.success,
                                          );
                                          Navigator.pop(
                                              context); // الرجوع للشاشة السابقة
                                        } else {
                                          showAnimatedSnackDialog(
                                            context,
                                            message:
                                                'Failed to delete opportunity.',
                                            type: AnimatedSnackBarType.error,
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            backgroundColor: Color(0xffB3D7ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            shadowColor: Colors.black,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/img/Delete.png',
                              width: 22,
                              height: 22,
                              fit: BoxFit.contain,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
