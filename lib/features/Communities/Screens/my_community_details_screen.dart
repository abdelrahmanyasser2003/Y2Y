import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Communities/model/get_all_communities_voulnteer_model.dart';
import 'package:y2y/features/Communities/provider/join_community_provider.dart';
import 'package:y2y/features/Communities/repo/community_details_repo.dart';
import 'package:y2y/features/Communities/widges/listrile_my_community_widget.dart';
import 'package:y2y/features/user/models/user_detils_model.dart';
import 'package:y2y/features/user/screens/user_details_screen.dart';

class MyCommunityDetailsScreen extends StatefulWidget {
  const MyCommunityDetailsScreen({super.key, required this.myCommunity});
  final CommunitiesModellvoulnteer myCommunity;

  @override
  State<MyCommunityDetailsScreen> createState() =>
      _MyCommunityDetailsScreenState();
}

class _MyCommunityDetailsScreenState extends State<MyCommunityDetailsScreen> {
  bool showAllRequests = false;

  late Future<UserDetailsModel> _userDetailsFuture;
  @override
  void initState() {
    super.initState();
    _userDetailsFuture = CommunityDetailsRepo()
        .getUserDetails(); // استرجاع تفاصيل المستخدم من API
  }

  @override
  Widget build(BuildContext context) {
    final requests = widget.myCommunity.askToJoin ?? [];
    final displayedRequests =
        showAllRequests ? requests : requests.take(3).toList();

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
                                          .myCommunity.image?.isNotEmpty ??
                                      false)
                                  ? NetworkImage(
                                      '${ApiEndpoints.baseUrl}${widget.myCommunity.image?.replaceAll("\\", "/")}')
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
                                    widget.myCommunity.name ?? '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: cornflowerblue,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    widget.myCommunity.desc ?? '',
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
                                widget.myCommunity.types?.first ?? 'Unknown',
                                style: const TextStyle(
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
                                widget.myCommunity.subcategory!.name ??
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
                              widget.myCommunity.numberOfMembers?.toString() ??
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
                              widget.myCommunity.location!.state ?? 'Unknown',
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
                                          .myCommunity.date!.startDate!
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
                                  widget.myCommunity.volunteer?.userName ?? "",
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
                                          .myCommunity.date!.endDate!
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
                                      widget.myCommunity.date?.schedule
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
                                                .myCommunity.date?.startAt
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
                                      widget.myCommunity.date?.schedule?.last ??
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
                                                .myCommunity.date?.finishAt
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
                                      widget.myCommunity.location?.city ?? '',
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
                                      widget.myCommunity.location?.city ?? '',
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
                          widget.myCommunity.roles ?? '',
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
                              "Requests :",
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
                                    : "View all (${widget.myCommunity.askToJoin?.length ?? 0})",
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
                            final requests = widget.myCommunity.askToJoin ?? [];
                            final displayedRequests = showAllRequests
                                ? requests
                                : requests.take(3).toList();
                            final request = displayedRequests[index];
                            final fullName =
                                '${request.firstName ?? ''} ${request.lastName ?? ''}';
                            final imageProvider = (request.profileImage !=
                                        null &&
                                    request.profileImage!.isNotEmpty)
                                ? NetworkImage(request.profileImage!)
                                : const AssetImage('assets/img/Male Avatar.png')
                                    as ImageProvider;

                            return ListrileMyCommunityWidget(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Userdetils(request: request),
                                  ),
                                );
                              },
                              cancelOnTap: () {},
                              chexkOnTap: () {},
                              backgroundImage: imageProvider,
                              title: fullName,
                            );
                          },
                        ),

                        hieghtspace(hieght: 90),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 220,
                                height: 48,
                                child: ElvatedButtonWidget(
                                  fontSize: 20,
                                  text: 'View',
                                  colorBorder: cornflowerblue,
                                  onPressed: () {},
                                  color: green,
                                  backgroundColor:
                                      WidgetStatePropertyAll(white),
                                )),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      EdgeInsets.all(0), // يمنع المساحة الزايدة
                                  backgroundColor: white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: cornflowerblue)),
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  backgroundColor: white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: cornflowerblue)),
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
