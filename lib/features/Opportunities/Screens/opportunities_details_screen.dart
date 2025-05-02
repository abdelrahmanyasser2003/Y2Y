import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';

class Opportunitiesdetils extends StatefulWidget {
  final GetAllOpportunities opportunity;
  const Opportunitiesdetils({super.key, required this.opportunity});

  @override
  State<Opportunitiesdetils> createState() => _OpportunitiesdetilsState();
}

class _OpportunitiesdetilsState extends State<Opportunitiesdetils> {
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
                        backgroundImage: widget.opportunity.image != null
                            ? NetworkImage(
                                '${ApiEndpoints.baseUrl}${widget.opportunity.image!.replaceAll('\\', '/')}',
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
                              widget.opportunity.title ?? '',
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
                              "at ${widget.opportunity.company}",
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
                  Text(
                    "Posted at : 03:40am Tue 21/01/2025",
                    style: TextStyle(
                        fontSize: 10,
                        color: cornflowerblue,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
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
                        widget.opportunity.company ?? "",
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
                    widget.opportunity.description ?? '',
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
                    widget.opportunity.responsibilities ?? "",
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
                    widget.opportunity.requirements ?? "",
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
                        widget.opportunity.duration ?? "",
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
                        widget.opportunity.deadline.toString(),
                        style: TextStyle(
                            fontSize: 13,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElvatedButtonWidget(
                        text: 'Apply',
                        onPressed: () async {
                          final Uri url = Uri.parse(widget.opportunity.link ??
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
                ],
              )),
        ),
      ),
    );
  }
}
