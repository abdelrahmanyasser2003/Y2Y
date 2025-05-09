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
import 'package:y2y/features/Opportunities/provider/update_opportunity_provider.dart';
import 'package:y2y/features/Search/provider/get_all_categoris_provider.dart';

class EditOpportunityScreen extends StatefulWidget {
  const EditOpportunityScreen(
      {super.key,
      required this.title,
      required this.company,
      required this.description,
      required this.responsibilities,
      required this.duration,
      required this.applicationdeadline,
      required this.requirementscontroller,
      required this.link,
      required this.imgPath,
      required this.opportunityId});
  final String title;
  final String opportunityId;
  final String link;
  final String company;
  final String description;
  final dynamic imgPath;

  final String responsibilities;
  final String duration;
  final String applicationdeadline;
  final String requirementscontroller;

  @override
  State<EditOpportunityScreen> createState() => _EditOpportunityScreenState();
}

class _EditOpportunityScreenState extends State<EditOpportunityScreen> {
  late TextEditingController titleController;

  late TextEditingController linkcontroller;
  late TextEditingController companycontroller;
  late TextEditingController descriptioncontroller;
  late TextEditingController responsibilitiescontroller;
  late TextEditingController requirementscontroller;
  late TextEditingController durationcontroller;
  late TextEditingController applicationdeadlinecontroller;
  @override
  void initState() {
    super.initState();
    imgPath = widget.imgPath;

    titleController = TextEditingController(text: widget.title);
    linkcontroller = TextEditingController(text: widget.link);
    companycontroller = TextEditingController(text: widget.company);
    descriptioncontroller = TextEditingController(text: widget.description);
    responsibilitiescontroller =
        TextEditingController(text: widget.responsibilities);
    requirementscontroller =
        TextEditingController(text: widget.requirementscontroller);
    durationcontroller = TextEditingController(text: widget.duration);
    applicationdeadlinecontroller =
        TextEditingController(text: widget.applicationdeadline);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllCategoriesProvider>(context, listen: false)
          .fetchCategories();
    });
  }

  @override
  void dispose() {
    applicationdeadlinecontroller.dispose();
    requirementscontroller.dispose();
    durationcontroller.dispose();
    descriptioncontroller.dispose();
    responsibilitiescontroller.dispose();
    companycontroller.dispose();
    titleController.dispose();
    linkcontroller.dispose();

    super.dispose();
  }

  dynamic imgPath;

  Future<void> _selectDate() async {
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
        applicationdeadlinecontroller.text = picked.toString().split(" ")[0];
      });
    }
  }

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
          color: cornflowerblue,
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

  Widget build(BuildContext context) {
    final provider = Provider.of<UpdateOpportunityProvider>(context);
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
                text: 'Edit Opportunity',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Opportunity Title',
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
              Text(
                "Opportunity Link",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                colors: cornflowerblue,
                controller: linkcontroller,
                textInputAction: TextInputAction.next,
              ),
              hieghtspace(hieght: 10),
              Text(
                "Company",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              Widthspace(width: 5),
              TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: companycontroller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next),
              hieghtspace(hieght: 10),
              Text(
                "Description",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              hieghtspace(hieght: 5),
              SingleChildScrollView(
                child: TextFormFieldWidget(
                    height: 100,
                    maxLines: 5,
                    colors: cornflowerblue,
                    controller: descriptioncontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next),
              ),
              hieghtspace(hieght: 10),
              Text(
                "Responsibilities",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: responsibilitiescontroller,
                  keyboardType: TextInputType.text,
                  height: 100,
                  maxLines: 5,
                  textInputAction: TextInputAction.next),
              hieghtspace(hieght: 10),
              Text(
                "Requirements",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: requirementscontroller,
                  keyboardType: TextInputType.text,
                  height: 100,
                  maxLines: 5,
                  textInputAction: TextInputAction.next),
              hieghtspace(hieght: 10),
              Text(
                "Duration",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: durationcontroller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next),
              hieghtspace(hieght: 10),
              Text(
                "Application Deadline",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              hieghtspace(hieght: 5),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Birth Date';
                  }
                  return null;
                },
                controller: applicationdeadlinecontroller,
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
                  _selectDate();
                },
              ),
              hieghtspace(hieght: 30),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElvatedButtonWidget(
                    onPressed: provider.isLoading
                        ? null
                        : () async {
                            File? imageFile;

                            if (imgPath != null && imgPath is Uint8List) {
                              imageFile = await convertUint8ListToFile(
                                  imgPath as Uint8List, 'image.jpg');
                            }

                            provider.updateOpportunity(
                              opportunityId: widget.opportunityId,
                              image: imageFile, // null لو مفيش صورة جديدة
                              title: titleController.text,
                              company: companycontroller.text,
                              description: descriptioncontroller.text,
                              responsibilities: responsibilitiescontroller.text,
                              requirements: requirementscontroller.text,
                              duration: durationcontroller.text,
                              deadline: applicationdeadlinecontroller.text,
                              onSuccess: () {
                                showAnimatedSnackDialog(
                                  context,
                                  message: 'Updated successfully',
                                  type: AnimatedSnackBarType.success,
                                );
                                Navigator.pop(context);
                              },
                            );
                          },
                    backgroundColor: WidgetStatePropertyAll(green),
                    color: white,
                    text: 'Submit',
                    fontSize: 20,
                  )),
              hieghtspace(hieght: 20),
            ],
          ),
        ),
      ),
    );
  }
}
