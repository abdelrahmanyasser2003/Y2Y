import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Search/Screens/search_communtiy.dart';
import 'package:y2y/features/Search/provider/get_all_subcategories_provider.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    super.key,
    required this.subCategory,
    required this.categoryId,
  });

  final String subCategory;
  final String categoryId;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllSubcategoriesProvider>(context, listen: false)
          .fetchSubcategories(widget.categoryId);
    });

    // Listener للبحث لو حبيت تعمل فلترة مستقبلًا
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetAllSubcategoriesProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(),
        ),
        backgroundColor: cornflowerblue,
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
              Row(
                children: [
                  const Text(
                    'Explore in :',
                    style: TextStyle(
                      color: white,
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Widthspace(width: 5),
                  Text(
                    widget.subCategory,
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

              /// Subcategories List
              Expanded(
                child: provider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: purple),
                      )
                    : provider.hasError
                        ? const Center(
                            child: Text(
                              'حدث خطأ أثناء جلب البيانات',
                              style: TextStyle(color: white),
                            ),
                          )
                        : provider.subcategories.isEmpty
                            ? const Center(
                                child: Text(
                                  'لا يوجد نتائج',
                                  style: TextStyle(color: white),
                                ),
                              )
                            : ListView.builder(
                                itemCount: provider.subcategories.length,
                                itemBuilder: (context, index) {
                                  final item = provider.subcategories[index];
                                  final name = item.name;

                                  // فلترة حسب البحث (لو عايزها ديناميكيًا)
                                  if (!_searchController.text
                                          .toLowerCase()
                                          .contains(name.toLowerCase()) &&
                                      _searchController.text.isNotEmpty) {
                                    return const SizedBox.shrink();
                                  }

                                  return GestureDetector(
                                    onTap: () {
                                      // التحقق إذا كانت القيمة موجودة أو لا
                                      final subcategoryId = item
                                          .id; // استخدم قيمة افتراضية إذا كانت null

                                      // إذا كانت القيمة فارغة أو null، يمكن إظهار رسالة خطأ أو التعامل معها بشكل آخر
                                      if (subcategoryId.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('فشل في تحميل الـ ID')),
                                        );
                                        return;
                                      }

                                      // تمرير subcategoryId إلى شاشة SearchCommuntiy
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SearchCommuntiy(
                                              subcategoryname: name,
                                              subcategoryId: subcategoryId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: white),
                                      child: ListTile(
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: cornflowerblue,
                                        ),
                                        title: Text(
                                          name,
                                          style: TextStyle(
                                              color: cornflowerblue,
                                              fontSize: 15,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
