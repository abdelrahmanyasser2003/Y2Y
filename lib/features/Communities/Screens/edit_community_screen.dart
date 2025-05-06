import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';

class EditCommunityScreen extends StatefulWidget {
  const EditCommunityScreen(
      {super.key,
      required this.desc,
      required this.enddate,
      required this.location,
      required this.meeting,
      required this.rules,
      required this.startdate,
      required this.imgPath,
      required this.title});
  final String title;
  final String startdate;
  final String enddate;
  final String desc;
  final String imgPath;
  final String meeting;
  final String rules;
  final String location;

  @override
  State<EditCommunityScreen> createState() => _EditCommunityScreenState();
}

class _EditCommunityScreenState extends State<EditCommunityScreen> {
  String categoryvalue = "Gender";
  final List<String> _dropdowncategory = ["Gender", "male", "femele"];
  String subcategoryvalue = "Gender";
  final List<String> _dropdownsubcategory = ["Gender", "male", "femele"];
  late TextEditingController startdateController = TextEditingController();
  late TextEditingController enddateController = TextEditingController();
  late TextEditingController describtionController = TextEditingController();
  late TextEditingController locaionController = TextEditingController();
  late TextEditingController meetingController = TextEditingController();
  late TextEditingController rulesController = TextEditingController();
  late TextEditingController titleController = TextEditingController();

  Future _selectenddate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(1990), lastDate: DateTime(2025));
    if (picked != null) {
      setState(() {
        enddateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future _selectstartdate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(1990), lastDate: DateTime(2025));
    if (picked != null) {
      setState(() {
        startdateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  String? imgPath;
  File? pickedImage;

  Future<void> uploadImage2Screen(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      String base64String = base64Encode(bytes); // تحويل الصورة إلى Base64
      setState(() {
        imgPath = base64String; // تخزين الصورة كـ String
      });
    }
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

    super.dispose();
  }

  showmodel() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: skyblue,
          padding: const EdgeInsets.all(10),
          height: 120.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.camera);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 50,
                    ),
                    Text(
                      "From Camera",
                      style: TextStyle(fontSize: 20.sp),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              GestureDetector(
                onTap: () {
                  uploadImage2Screen(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 50,
                    ),
                    Text(
                      "From Gallery",
                      style: TextStyle(fontSize: 20.sp),
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
                          radius: 40,
                          backgroundImage: pickedImage != null
                              ? FileImage(pickedImage!)
                              : (imgPath!.contains("http")
                                  ? NetworkImage(imgPath!)
                                  : const AssetImage(
                                          "assets/images/default_avatar.png")
                                      as ImageProvider),
                        ),
                        Positioned(
                          left: 18,
                          bottom: 18,
                          child: IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (image != null) {
                                setState(() {
                                  pickedImage = File(image.path);
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 20,
                            ),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
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
                          value: categoryvalue,
                          items: _dropdowncategory.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              categoryvalue = value!;
                            });
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
                          value: subcategoryvalue,
                          items: _dropdownsubcategory.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              subcategoryvalue = value!;
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
              TextFormFieldWidget(
                colors: cornflowerblue,
                controller: locaionController,
                width: double.infinity,
                height: 60,
                hintText: 'Community Governorate Location',
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
                  onPressed: () {},
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
