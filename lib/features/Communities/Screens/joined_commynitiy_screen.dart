import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Communities/model/get_all_communities_voulnteer_model.dart';
import 'package:y2y/features/Communities/provider/join_community_provider.dart';
import 'package:y2y/features/Communities/repo/community_details_repo.dart';
import 'package:y2y/features/Communities/widges/listrile_community_widget.dart';
import 'package:y2y/features/user/models/user_detils_model.dart';
import 'package:y2y/features/user/screens/user_details_screen.dart';

class JoinedCommynitiyScreen extends StatefulWidget {
  const JoinedCommynitiyScreen({super.key, required this.joinedCommunity});
  final CommunitiesModellvoulnteer joinedCommunity;

  @override
  State<JoinedCommynitiyScreen> createState() => _JoinedCommynitiyScreenState();
}

class _JoinedCommynitiyScreenState extends State<JoinedCommynitiyScreen> {
  bool showAllRequests = false;
  @override
  void initState() {
    super.initState();
    _userDetailsFuture = CommunityDetailsRepo()
        .getUserDetails(); // استرجاع تفاصيل المستخدم من API
  }

  late Future<UserDetailsModel> _userDetailsFuture;
  @override
  Widget build(BuildContext context) {
    final members = widget.joinedCommunity.members ?? [];
    final displayedRequests =
        showAllRequests ? members : members.take(3).toList();

    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(),
        ),
        body: Consumer<JoinCommunityProvider>(
          builder: (context, provider, child) {
            return FutureBuilder<UserDetailsModel>(
              future:
                  _userDetailsFuture, // التأكد من تعريف الـ future بشكل صحيح
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(), // عرض مؤشر تحميل
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("فشل في تحميل البيانات: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 11, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: (widget
                                          .joinedCommunity.image?.isNotEmpty ??
                                      false)
                                  ? NetworkImage(
                                      '${ApiEndpoints.baseUrl}${widget.joinedCommunity.image?.replaceAll("\\", "/")}')
                                  : AssetImage(
                                          'assets/images/default_community.png')
                                      as ImageProvider,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.joinedCommunity.name ?? '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: cornflowerblue,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    widget.joinedCommunity.desc ?? '',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: cornflowerblue,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.cancel_outlined,
                                size: 30,
                                color: cornflowerblue,
                              ),
                            ),
                          ],
                        ),
                        hieghtspace(hieght: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Category:",
                              style: TextStyle(
                                fontSize: 11,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: white),
                                  borderRadius: BorderRadius.circular(10),
                                  color: cornflowerblue),
                              child: Text(
                                widget.joinedCommunity.types?.first ??
                                    'Unknown',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Subcategory:",
                              style: TextStyle(
                                fontSize: 11,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: white),
                                  borderRadius: BorderRadius.circular(10),
                                  color: cornflowerblue),
                              child: Text(
                                widget.joinedCommunity.subcategory!.name ??
                                    'Unknown',
                                style: const TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        hieghtspace(hieght: 10),
                        Row(
                          children: [
                            Text(
                              "Members:",
                              style: TextStyle(
                                fontSize: 11,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Widthspace(width: 55),
                            Text(
                              widget.joinedCommunity.numberOfMembers
                                      ?.toString() ??
                                  '0',
                              style: TextStyle(
                                fontSize: 11,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Widthspace(width: 60),
                            Text(
                              "Location:",
                              style: TextStyle(
                                fontSize: 11,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Widthspace(width: 65),
                            Text(
                              widget.joinedCommunity.location!.state ??
                                  'Unknown',
                              style: TextStyle(
                                fontSize: 11,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                        hieghtspace(hieght: 10),
                        Divider(
                          color: purple,
                          thickness: 0.5,
                        ),
                        hieghtspace(hieght: 10),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Volunteer (Admin) :",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                hieghtspace(hieght: 15),
                                Text(
                                  "Start Date :",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                hieghtspace(hieght: 5),
                                Text(
                                  DateFormat('E dd/MM/yyyy').format(
                                      DateTime.parse(widget
                                          .joinedCommunity.date!.startDate!
                                          .toString())),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            ),
                            Widthspace(width: 45),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.joinedCommunity.volunteer?.userName ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                hieghtspace(hieght: 15),
                                Text(
                                  "End Date :",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                hieghtspace(hieght: 5),
                                Text(
                                  DateFormat('E dd/MM/yyyy').format(
                                      DateTime.parse(widget
                                          .joinedCommunity.date!.endDate!
                                          .toString())),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cornflowerblue,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        hieghtspace(hieght: 10),
                        Divider(
                          color: purple,
                          thickness: 0.5,
                        ),
                        hieghtspace(hieght: 10),
                        Text(
                          "Meeting Schedule :",
                          style: TextStyle(
                            fontSize: 20,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                          ),
                        ),
                        hieghtspace(hieght: 10),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    hieghtspace(hieght: 5),
                                    Text(
                                      widget.joinedCommunity.date?.schedule
                                              ?.first ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                    Text(
                                      ' at',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                    Text(
                                      DateFormat(' h:mm a').format(
                                        DateTime.parse(widget
                                                .joinedCommunity.date?.startAt
                                                .toString() ??
                                            ''),
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ],
                                ),
                                hieghtspace(hieght: 5),
                                Row(
                                  children: [
                                    hieghtspace(hieght: 5),
                                    Text(
                                      widget.joinedCommunity.date?.schedule
                                              ?.last ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                    Text(
                                      ' at',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                    Text(
                                      DateFormat(' h:mm a').format(
                                        DateTime.parse(widget
                                                .joinedCommunity.date?.finishAt
                                                .toString() ??
                                            ''),
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Widthspace(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Location:",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                    Widthspace(width: 3),
                                    Text(
                                      widget.joinedCommunity.location?.city ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ],
                                ),
                                hieghtspace(hieght: 5),
                                Row(
                                  children: [
                                    Text(
                                      "Location:",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                    Widthspace(width: 3),
                                    Text(
                                      widget.joinedCommunity.location?.city ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        hieghtspace(hieght: 10),
                        Divider(
                          color: purple,
                          thickness: 0.5,
                        ),
                        hieghtspace(hieght: 10),
                        Text(
                          "Community Roles :",
                          style: TextStyle(
                            fontSize: 20,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                          ),
                        ),
                        hieghtspace(hieght: 5),
                        Text(
                          widget.joinedCommunity.roles ?? '',
                          style: TextStyle(
                            fontSize: 13,
                            color: cornflowerblue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto",
                          ),
                        ),
                        hieghtspace(hieght: 10),
                        Divider(
                          color: purple,
                          thickness: 0.5,
                        ),
                        hieghtspace(hieght: 10),
                        // العنوان مع عدد الطلبات
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Members :",
                              style: TextStyle(
                                fontSize: 20,
                                color: cornflowerblue,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showAllRequests = !showAllRequests;
                                });
                              },
                              child: Text(
                                showAllRequests
                                    ? "View less"
                                    : "View all (${widget.joinedCommunity.members?.length ?? 0})",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: cornflowerblue,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ),
                          ],
                        ),

                        hieghtspace(hieght: 10),
                        ListView.separated(
                          separatorBuilder: (context, index) =>
                              const Divider(color: purple),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayedRequests.length,
                          itemBuilder: (context, index) {
                            final join = widget.joinedCommunity.members ?? [];
                            final displayedRequests =
                                showAllRequests ? join : join.take(3).toList();
                            final joined = displayedRequests[index];

                            return ListrileCommunityWidget(
                              title: "",
                              onTap: () {},
                            );
                          },
                        ),

                        hieghtspace(hieght: 90),
                        SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: WidgetStatePropertyAll(5),
                                  shadowColor:
                                      WidgetStatePropertyAll(Colors.black),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.red))),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Leave',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                      color: white,
                                      fontFamily: "Poppins"),
                                ))),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text("لا توجد بيانات لعرضها"));
                }
              },
            );
          },
        ));
  }
}
