import 'dart:io';
import 'dart:typed_data';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/screens/home_screen.dart';
import 'package:y2y/features/Communities/provider/update_community_provider.dart';
import 'package:y2y/features/Search/models/category_model.dart';
import 'package:y2y/features/Search/models/subcategory_model.dart';
import 'package:y2y/features/Search/provider/get_all_categoris_provider.dart';
import 'package:y2y/features/Search/provider/get_all_subcategories_provider.dart';

class EditCommunityScreen extends StatefulWidget {
  const EditCommunityScreen(
      {super.key,
      required this.desc,
      required this.enddate,
      required this.location,
      required this.meeting,
      required this.limitOfUsers,
      required this.city,
      required this.endAt,
      required this.startAt,
      required this.tyeps,
      required this.state,
      required this.street,
      required this.rules,
      required this.startdate,
      required this.communityId,
      required this.category,
      required this.subcCategory,
      required this.imgPath,
      required this.title});
  final String title;
  final TimeOfDay startAt;
  final TimeOfDay endAt;
  final String tyeps;
  final String street;
  final String city;
  final String state;
  final String category;
  final String subcCategory;
  final int limitOfUsers;
  final String communityId;

  final String startdate;
  final String enddate;
  final String desc;
  final dynamic imgPath;
  final String meeting;
  final String rules;
  final String location;

  @override
  State<EditCommunityScreen> createState() => _EditCommunityScreenState();
}

class _EditCommunityScreenState extends State<EditCommunityScreen> {
  CategoryModel? selectedCategory;
  SubcategoryModel? selectedSubcategory;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedFinishTime;
  List<CategoryModel> categories = [];
  List<SubcategoryModel> subcategories = [];

  late TextEditingController startdateController = TextEditingController();
  late TextEditingController enddateController = TextEditingController();
  late TextEditingController describtionController = TextEditingController();
  late TextEditingController locaionController = TextEditingController();
  late TextEditingController meetingController = TextEditingController();
  late TextEditingController rulesController = TextEditingController();
  late TextEditingController titleController = TextEditingController();
  late TextEditingController limitOfUsersController = TextEditingController();
  late TextEditingController typesController = TextEditingController();
  late TextEditingController streercontroller = TextEditingController();
  late TextEditingController citycontroller = TextEditingController();
  late TextEditingController finishAtController = TextEditingController();
  late TextEditingController startAtController = TextEditingController();
  late TextEditingController categotyController = TextEditingController();
  late TextEditingController subCategotyController = TextEditingController();

  Future<void> _selectenddate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
              surface: cornflowerblue,
              primary: white,
              onPrimary: cornflowerblue,
              onSurface: white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        enddateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  String dropdwonvaluestate = "State";
  final List<String> _dropdownstate = [
    "State",
    "القاهرة",
    "الإسكندرية",
    "الإسماعيلية",
    "السويس",
    "أسوان",
    "أسيوط",
    "الأقصر",
    "البحر الأحمر",
    "البحيرة",
    "	بني سويف",
    "بورسعيد",
    "جنوب سيناء",
    "الجيزة",
    "الدقهلية",
    "دمياط",
    "سوهاج",
    "الشرقية",
    "شمال سيناء",
    "الغربية",
    "الفيوم",
    "القليوبية",
    "قنا",
    "	كفر الشيخ",
    "مطروح",
    "المنوفية",
    "المنيا",
    "الوادي الجديد"
  ];

  Future<void> _selectstartdate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
              surface: cornflowerblue,
              primary: white,
              onPrimary: cornflowerblue,
              onSurface: white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        startdateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime(
    BuildContext context,
    TextEditingController controller,
    Function(TimeOfDay) onTimeSelected,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: cornflowerblue, // لون رأس الساعة والأزرار
              onPrimary: white, // لون النص داخل الأزرار
              onSurface: cornflowerblue,

              // لون النص العادي
            ),
            timePickerTheme: TimePickerThemeData(
              dayPeriodTextColor: Colors.black,
              dayPeriodColor: cornflowerblue,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onTimeSelected(picked);
      controller.text = picked.format(context);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    startAtController.text = widget.startAt.format(context);
    selectedStartTime = widget.startAt;

    finishAtController.text = widget.endAt.format(context);
    selectedFinishTime = widget.endAt;
  }

  @override
  void initState() {
    super.initState();
    imgPath = widget.imgPath;

    startdateController = TextEditingController(text: widget.startdate);
    describtionController = TextEditingController(text: widget.desc);
    enddateController = TextEditingController(text: widget.enddate);
    locaionController = TextEditingController(text: widget.location);
    rulesController = TextEditingController(text: widget.rules);
    meetingController = TextEditingController(text: widget.meeting);
    titleController = TextEditingController(text: widget.title);
    streercontroller = TextEditingController(text: widget.street);
    citycontroller = TextEditingController(text: widget.city);

    limitOfUsersController =
        TextEditingController(text: widget.limitOfUsers.toString());
    typesController = TextEditingController(text: widget.tyeps);
    categotyController = TextEditingController(text: widget.category);
    subCategotyController = TextEditingController(text: widget.subcCategory);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllCategoriesProvider>(context, listen: false)
          .fetchCategories();
    });
  }

  @override
  void dispose() {
    startdateController.dispose();
    enddateController.dispose();
    describtionController.dispose();
    locaionController.dispose();
    rulesController.dispose();
    meetingController.dispose();
    titleController.dispose();
    streercontroller.dispose();
    citycontroller.dispose();
    startAtController.dispose();
    finishAtController.dispose();
    limitOfUsersController.dispose();
    typesController.dispose();
    categotyController.dispose();
    subCategotyController.dispose();

    super.dispose();
  }

  dynamic imgPath;

  Future<void> uploadImage2Screen(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      setState(() {
        imgPath = bytes;
      });
    }
  }

  Future<File> convertUint8ListToFile(Uint8List data, String filename) async {
    final tempDir = await getTemporaryDirectory();
    final file = File(path.join(tempDir.path, filename));
    return await file.writeAsBytes(data);
  }

  showModel(BuildContext context) {
    return showModalBottomSheet(
      context: context, // استخدام BuildContext هنا
      builder: (BuildContext context) {
        return Container(
          color:
              cornflowerblue, // تغيير skyblue إلى Colors.skyBlue أو أي لون آخر
          padding: const EdgeInsets.all(10),
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.camera);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "From Camera",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  uploadImage2Screen(ImageSource.gallery);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.photo_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "From Gallery",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<GetAllCategoriesProvider>(context);
    final allCategories = categoriesProvider.categories;

    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleAndBackWidget(
                text: 'Edit Community',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Community Title',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      hieghtspace(hieght: 5),
                      TextFormFieldWidget(
                        controller: titleController,
                        colors: cornflowerblue,
                        width: 220,
                        height: 60,
                      ),
                    ],
                  ),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          backgroundImage: imgPath == null
                              ? null // إذا مفيش صورة، خلي الخلفية بيضاء
                              : imgPath is String && imgPath.startsWith('http')
                                  ? NetworkImage(imgPath) // صورة من URL
                                  : imgPath is String
                                      ? NetworkImage(
                                          '${ApiEndpoints.baseUrl}${imgPath.replaceAll("\\", "/")}')
                                      : imgPath is Uint8List
                                          ? MemoryImage(
                                              imgPath) // صورة من الجهاز
                                          : null, // لو النوع غير معروف
                        ),
                        Positioned(
                          left: 22,
                          bottom: 23,
                          child: IconButton(
                            onPressed: () {
                              showModel(context);
                            },
                            icon: const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 30,
                            ),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              hieghtspace(hieght: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      hieghtspace(hieght: 5),
                      Container(
                        width: 150.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<CategoryModel>(
                          isExpanded: true,
                          value: selectedCategory,
                          icon: const Icon(Icons.arrow_drop_down,
                              color: cornflowerblue),
                          style: const TextStyle(
                            fontFamily: "Lato",
                            color: cornflowerblue,
                            fontWeight: FontWeight.w500,
                          ),
                          dropdownColor: white,
                          items: allCategories.map((cat) {
                            return DropdownMenuItem<CategoryModel>(
                              value: cat,
                              child: Text(cat.name ?? ''),
                            );
                          }).toList(),
                          onChanged: (CategoryModel? value) async {
                            setState(() {
                              selectedCategory = value;
                              selectedSubcategory =
                                  null; // Reset selected subcategory when category changes
                            });

                            // تأكد من وجود فئة مختارة قبل استدعاء الفئات الفرعية
                            if (value != null) {
                              final subProvider =
                                  Provider.of<GetAllSubcategoriesProvider>(
                                      context,
                                      listen: false);
                              await subProvider
                                  .fetchSubcategories(value.id ?? '');

                              setState(() {
                                // تحديث الفئات الفرعية بناءً على الفئة المختارة
                                subcategories = subProvider.subcategories;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SubCategory',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      hieghtspace(hieght: 5),
                      Container(
                        width: 150.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<SubcategoryModel>(
                          isExpanded: true,
                          value: selectedSubcategory,
                          icon: const Icon(Icons.arrow_drop_down,
                              color: cornflowerblue),
                          style: const TextStyle(
                            fontFamily: "Lato",
                            color: cornflowerblue,
                            fontWeight: FontWeight.w500,
                          ),
                          dropdownColor: white,
                          items: subcategories.map((sub) {
                            return DropdownMenuItem<SubcategoryModel>(
                              value:
                                  sub, // تأكد من أن sub هو من نوع SubcategoryModel
                              child: Text(sub
                                  .name), // تأكد من أن "name" هو خاصية موجودة في SubcategoryModel
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSubcategory = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              hieghtspace(hieght: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      hieghtspace(hieght: 5),
                      SizedBox(
                        width: 150.w,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Birth Date';
                            }
                            return null;
                          },
                          controller: startdateController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: cornflowerblue),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectstartdate();
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      hieghtspace(hieght: 5),
                      SizedBox(
                        width: 150.w,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Birth Date';
                            }
                            return null;
                          },
                          controller: enddateController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: cornflowerblue),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectenddate();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              hieghtspace(hieght: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start at',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      TextFormFieldWidget(
                        colors: cornflowerblue,
                        readOnly: true,
                        onTap: () =>
                            _selectTime(context, startAtController, (time) {
                          selectedStartTime = time;
                        }),
                        controller: startAtController,
                        width: 150,
                        height: 60,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End at',
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      TextFormFieldWidget(
                        colors: cornflowerblue,
                        readOnly: true,
                        onTap: () =>
                            _selectTime(context, finishAtController, (time) {
                          selectedFinishTime = time;
                        }),
                        controller: finishAtController,
                        width: 150,
                        height: 60,
                      ),
                    ],
                  )
                ],
              ),
              hieghtspace(hieght: 10),
              Text(
                'limit Of Users',
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                colors: cornflowerblue,
                controller: limitOfUsersController,
                width: double.infinity,
                height: 60,
                hintText: 'limit Of Users',
              ),
              Text(
                'Types',
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                colors: cornflowerblue,
                controller: typesController,
                width: double.infinity,
                height: 60,
                hintText: 'Community types',
              ),
              hieghtspace(hieght: 10),
              Text(
                'Community Describtion',
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                colors: cornflowerblue,
                controller: describtionController,
                width: double.infinity,
                height: 60,
                hintText: 'Describe Community Shortly...',
              ),
              hieghtspace(hieght: 5),
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),
              ),
              hieghtspace(hieght: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextFormFieldWidget(
                      width: 100.w,
                      height: 50.h,
                      maxLength: null,
                      maxLines: null,
                      controller: streercontroller,
                      colors: cornflowerblue,
                      hintText: 'Streer',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required ';
                        }
                        return null;
                      },
                      suffixIcon: null,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormFieldWidget(
                      width: 100.w,
                      height: 50.h,
                      maxLength: null,
                      maxLines: null,
                      controller: citycontroller,
                      hintText: 'City',
                      colors: cornflowerblue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required ';
                        }
                        return null;
                      },
                      suffixIcon: null,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 100.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: cornflowerblue,
                          ),
                          style: const TextStyle(
                              fontFamily: "Lato",
                              color: cornflowerblue,
                              fontWeight: FontWeight.w500),
                          dropdownColor: white,
                          value: dropdwonvaluestate,
                          items: _dropdownstate.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdwonvaluestate = value!;
                            });
                          },
                        ),
                      ))
                ],
              ),
              hieghtspace(hieght: 5),
              Text(
                'Meeting Schedule',
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                colors: cornflowerblue,
                controller: meetingController,
                width: double.infinity,
                height: 128,
                maxLines: 5,
                hintText:
                    'Describe Meetings Schedule with time and location...',
              ),
              hieghtspace(hieght: 5),
              Text(
                'Community Rules',
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                colors: cornflowerblue,
                controller: rulesController,
                width: double.infinity,
                height: 128,
                maxLines: 5,
                hintText: 'Describe Community Rules in points...',
              ),
              hieghtspace(hieght: 30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElvatedButtonWidget(
                  onPressed: () async {
                    File? imageFile; // ✅ تعريف المتغير هنا في الأعلى

                    List<String> types = typesController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList();

                    Map<String, String> location = {
                      'state': dropdwonvaluestate,
                      'city': citycontroller.text,
                      'street': streercontroller.text,
                    };

                    String formatTimeOfDay(TimeOfDay time) {
                      final hour = time.hour.toString().padLeft(2, '0');
                      final minute = time.minute.toString().padLeft(2, '0');
                      return "T$hour:$minute:00.000Z";
                    }

                    if (selectedStartTime == null ||
                        selectedFinishTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('الرجاء اختيار وقت البداية والنهاية'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    Map<String, dynamic> date = {
                      "startDate":
                          "${startdateController.text}${formatTimeOfDay(selectedStartTime!)}",
                      "endDate":
                          "${enddateController.text}${formatTimeOfDay(selectedFinishTime!)}",
                      "schedule": meetingController.text
                          .split(',')
                          .map((e) => e.trim())
                          .toList(),
                      "startAt": formatTimeOfDay(selectedStartTime!),
                      "finishAt": formatTimeOfDay(selectedFinishTime!),
                    };

                    if (imgPath == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('الرجاء اختيار صورة للمجتمع'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // ✅ تحويل imgPath إلى ملف
                    if (imgPath != null && imgPath is Uint8List) {
                      imageFile = await convertUint8ListToFile(
                          imgPath as Uint8List, 'update.jpeg');
                    }

                    final provider = context.read<UpdateCommunityProvider>();

                    bool success = await provider.updateCommunity(
                      communityId: widget.communityId,
                      name: titleController.text.isNotEmpty
                          ? titleController.text
                          : null,
                      types: typesController.text.isNotEmpty ? types : null,
                      desc: describtionController.text.isNotEmpty
                          ? describtionController.text
                          : null,
                      category: selectedCategory?.id,
                      subcategory: selectedSubcategory?.id,
                      limitOfUsers: limitOfUsersController.text.isNotEmpty
                          ? int.parse(limitOfUsersController.text)
                          : null,
                      roles: rulesController.text.isNotEmpty
                          ? rulesController.text
                          : null,
                      location: location,
                      date: date,
                      imagePath: imageFile, // ✅ صار معرف هنا
                    );

                    if (success) {
                      showAnimatedSnackDialog(
                        context,
                        message: 'تم التحديث بنجاح',
                        type: AnimatedSnackBarType.success,
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    } else {
                      showAnimatedSnackDialog(
                        context,
                        message: 'فشل التحديث، حاول مرة أخرى',
                        type: AnimatedSnackBarType.error,
                      );
                    }
                  },
                  backgroundColor: WidgetStatePropertyAll(green),
                  color: white,
                  text: 'Submit',
                  fontSize: 20,
                ),
              ),
              hieghtspace(hieght: 10),
            ],
          ),
        ),
      ),
    );
  }
}
