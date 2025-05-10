import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/features/Communities/model/get_spacific_community_model.dart';
import 'package:y2y/features/Communities/provider/join_community_provider.dart';
import 'package:y2y/features/Communities/repo/cancel_join_repo.dart';
import 'package:y2y/features/Communities/repo/community_details_repo.dart';
import 'package:y2y/features/Communities/repo/join_community_repo.dart';
import 'package:y2y/features/Communities/widges/listrile_community_widget.dart';
import 'package:y2y/features/Communities/widges/listtile_volunteer_widget.dart';
import 'package:y2y/features/user/models/user_detils_model.dart';

class SearchCommunityDetails extends StatefulWidget {
  const SearchCommunityDetails(
      {super.key, required this.communitySearch, required this.communityId});
  final GetSpacificCommunityModel communitySearch;
  final GetSpacificCommunityModel communityId;

  @override
  State<SearchCommunityDetails> createState() => _SearchCommunityDetailsState();
}

class _SearchCommunityDetailsState extends State<SearchCommunityDetails> {
  late Future<UserDetailsModel> _userDetailsFuture;
  bool hasRequested = false;
  bool showAllRequests = false;

  @override
  void initState() {
    super.initState();
    _userDetailsFuture = CommunityDetailsRepo()
        .getUserDetails(); // استرجاع تفاصيل المستخدم من API
  }

  @override
  Widget build(BuildContext context) {
    final volunteer = widget.communitySearch.volunteer;
    final members = widget.communitySearch.members ?? [];
    final displayedRequests =
        showAllRequests ? members : members.take(2).toList();

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
                                          .communitySearch.image?.isNotEmpty ??
                                      false)
                                  ? NetworkImage(
                                      '${ApiEndpoints.baseUrl}${widget.communitySearch.image?.replaceAll("\\", "/")}')
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
                                    widget.communitySearch.name ?? '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: cornflowerblue,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    widget.communitySearch.desc ?? '',
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
                                widget.communitySearch.category?.name ??
                                    'Unknown',
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
                                widget.communitySearch.subcategory!.name ??
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
                              widget.communitySearch.numberOfMembers
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
                              widget.communitySearch.location!.state ??
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
                                          .communitySearch.date!.startDate!
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
                                  widget.communitySearch.volunteer?.userName ??
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
                                          .communitySearch.date!.endDate!
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
                                      widget.communitySearch.date?.schedule
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
                                                .communitySearch.date?.startDate
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
                                      widget.communitySearch.date?.schedule
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
                                                .communitySearch.date?.endDate
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
                                      widget.communitySearch.location?.city ??
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
                                      widget.communitySearch.location?.city ??
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
                          widget.communitySearch.roles ?? '',
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
                                    : "View all (${widget.communitySearch.members?.length ?? 0})",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (volunteer != null) ...[
                              ListtileVolunteerWidget(
                                backgroundImage: NetworkImage(
                                  '${ApiEndpoints.baseUrl}${volunteer.profileImage?.replaceAll("\\", "/") ?? ""}',
                                ),
                                title:
                                    '${volunteer.firstName ?? ''} ${volunteer.lastName ?? ''}',
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         UserDetialsMembersScreen(
                                  //             members: volunteer),
                                  //   ),
                                  // );
                                },
                              ),
                            ],
                            Divider(
                              color: purple,
                            ),
                            hieghtspace(hieght: 5),
                            ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(color: purple),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: displayedRequests.length,
                              itemBuilder: (context, index) {
                                print(
                                    'عدد العاضاء: ${displayedRequests.length}');

                                final member = displayedRequests[index];
                                return ListrileCommunityWidget(
                                  backgroundImage: NetworkImage(
                                    '${ApiEndpoints.baseUrl}${member.profileImage?.replaceAll("\\", "/") ?? ""}',
                                  ),
                                  title:
                                      '${member.firstName ?? ''} ${member.lastName ?? ''}',
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         UserDetialsMembersScreen(
                                    //       members: member,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        hieghtspace(hieght: 90),
                        SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (widget.communitySearch.id == null) {
                                  showAnimatedSnackDialog(
                                    context,
                                    type: AnimatedSnackBarType.error,
                                    message:
                                        "Community data is missing or invalid.",
                                  );
                                  return;
                                }

                                if (hasRequested) {
                                  // عرض SnackBar لتأكيد الإلغاء مباشرة
                                  final shouldCancel = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: cornflowerblue,
                                      title: Text(
                                        'Are you sure you want to cancel the request?',
                                        style: TextStyle(
                                            color: white,
                                            fontFamily: 'Roboto',
                                            fontSize: 19),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: Text('NO',
                                              style: TextStyle(
                                                  color: white,
                                                  fontFamily: 'Roboto')),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: Text('YES',
                                              style: TextStyle(
                                                  color: white,
                                                  fontFamily: 'Roboto')),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (shouldCancel == true) {
                                    // إلغاء الطلب عبر الـ API
                                    await CancelJoinRepo().cancelJoinRequest(
                                      widget.communitySearch.id?.toString() ??
                                          '', // التأكد أن id ليس null
                                      context,
                                    );

                                    setState(() {
                                      hasRequested =
                                          false; // إعادة تعيين حالة الطلب
                                    });
                                  }
                                } else {
                                  // تحقق من provider.isLoading قبل استخدامه
                                  await JoinCommunityRepo()
                                      .sendRequestToCommunity(
                                    widget.communitySearch.id?.toString() ??
                                        '', // التأكد أن id ليس null
                                    context,
                                  );

                                  setState(() {
                                    hasRequested =
                                        true; // تغيير حالة الزر بعد الطلب
                                  });
                                }
                              },
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(5),
                                shadowColor:
                                    WidgetStatePropertyAll(Colors.black),
                                backgroundColor:
                                    WidgetStatePropertyAll(cornflowerblue),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                side: WidgetStatePropertyAll(
                                    BorderSide(color: cornflowerblue)),
                              ),
                              child: provider.isLoading == true
                                  ? CircularProgressIndicator() // عرض الـ loading أثناء الإرسال
                                  : Text(
                                      hasRequested
                                          ? 'Cancel Request'
                                          : 'Request',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                            ))
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
