import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Search/Screens/search_result.dart';
import 'package:y2y/features/Search/provider/get_all_categoris_provider.dart';
import 'package:y2y/features/Search/widges/list_tile_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();

    // استدعاء البيانات بعد بناء الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllCategoriesProvider>(context, listen: false)
          .fetchCategories();
    });

    // عند الكتابة في البحث نعمل setState لتحديث النتائج
    _searchController.addListener(() {
      setState(() {
        searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<GetAllCategoriesProvider>(context);
    final allCategories = categoriesProvider.categories;

    // فلترة الكاتيجوريز حسب النص المكتوب
    final filteredCategories = allCategories.where((category) {
      final name = category.name?.toLowerCase() ?? '';
      return name.contains(searchText);
    }).toList();

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
            /// Back Button
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
            ),
            hieghtspace(hieght: 30),

            /// Title
            const Text(
              'Explore Categories',
              style: TextStyle(
                color: white,
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 10),
            Expanded(
              child: filteredCategories.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchResult(
                                          subCategory: category.name ?? '',
                                          categoryId: category.id ?? "",
                                        )));
                          },
                          child: ListTileWidget(
                            title: category.name ?? '',
                            subTitle: category.desc ?? '',
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: purple,
                    )),
            )
          ],
        ),
      ),
    );
  }
}
