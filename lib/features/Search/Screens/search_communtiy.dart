import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Communities/Screens/communitys_details_screen.dart';
import 'package:y2y/features/Communities/model/get_all_communities_model.dart';
import 'package:y2y/features/Search/models/search_model.dart';
import 'package:y2y/features/Search/provider/get_all_communities_of_specific_subcategory_provider.dart';
import 'package:y2y/features/Search/provider/search_provider.dart';

class SearchCommuntiy extends StatefulWidget {
  final String subcategoryId;
  final String subcategoryname;
  const SearchCommuntiy(
      {super.key, required this.subcategoryId, required this.subcategoryname});

  @override
  State<SearchCommuntiy> createState() => _SearchCommuntiyState();
}

class _SearchCommuntiyState extends State<SearchCommuntiy> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final communityProvider =
          Provider.of<GetAllCommunitiesOfSpecificSubcategoryProvider>(context,
              listen: false);
      final searchProvider =
          Provider.of<SearchProvider>(context, listen: false);

      // تحميل الكوميونتيز
      await communityProvider
          .fetchCommunitiesBySubcategory(widget.subcategoryId);

      // بعد التحميل نضيفهم للبحث
      searchProvider.setAllItems(
        communityProvider.communities
            .map((item) => SearchModel(name: item['name'], data: item))
            .toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Back',
                    style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: white,
                  ),
                ],
              ),
            ),
            hieghtspace(hieght: 10),

            /// Search Field
            TextFormFieldWidget(
              controller: _searchController,
              hintText: 'Search...',
              onChanged: (value) {
                Provider.of<SearchProvider>(context, listen: false)
                    .searchItems(value);
              },
            ),
            hieghtspace(hieght: 30),
            Row(
              children: [
                const Text(
                  'All Communities in :',
                  style: TextStyle(
                    color: white,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Widthspace(width: 5),
                Text(
                  widget.subcategoryname,
                  style: const TextStyle(
                    color: white,
                    fontSize: 13,
                    fontFamily: 'Rob',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            hieghtspace(hieght: 10),
            Expanded(
              child: Consumer<GetAllCommunitiesOfSpecificSubcategoryProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.hasError) {
                    return Center(child: Text(provider.errorMessage));
                  }

                  if (provider.communities.isEmpty) {
                    return const Center(
                        child: Text('لا توجد كوميونتيز في هذه الفئة.'));
                  }

                  return ListView.builder(
                    itemCount: provider.communities.length,
                    itemBuilder: (context, index) {
                      var community = provider.communities[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommunityDetails(
                                  community:
                                      GetAllCommunitiesModel.fromJson(community)),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          margin: const EdgeInsets.only(bottom: 15),
                          height: 150,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    '${ApiEndpoints.baseUrl}${community['image'].replaceAll('\\', '/')}'),
                                radius: 40,
                              ),
                              const SizedBox(width: 7),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      community['name'] ??
                                          'No Name', // عرض اسم المجتمع
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: cornflowerblue,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        community['desc'] ??
                                            'No Description', // عرض الوصف
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: cornflowerblue,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Chip(
                                          side: const BorderSide(color: white),
                                          padding: const EdgeInsets.all(0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          label: Text(
                                            community['types']
                                                [0], // عرض فئة أو نوع المجتمع
                                            style: const TextStyle(
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w800,
                                              color: white,
                                            ),
                                          ),
                                          backgroundColor: cornflowerblue,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CommunityDetails(
                                                        community:
                                                            GetAllCommunitiesModel
                                                                .fromJson(
                                                                    community)),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Show Community',
                                            style: TextStyle(
                                              color: cornflowerblue,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}