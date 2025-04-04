import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/provider/edit_profile_provider.dart';

import 'package:y2y/ui/Screens/Profile_Setup_Screens/interest_selection_screen.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';

class Profilepicabout extends StatefulWidget {
  const Profilepicabout({super.key});

  @override
  State<Profilepicabout> createState() => _ProfilepicaboutState();
}

class _ProfilepicaboutState extends State<Profilepicabout> {
  bool isbuttonenabled = false;
  validateform() {
    setState(() {
      isbuttonenabled = _formKey.currentState?.validate() ?? false;
    });
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Future _selectdate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(1990), lastDate: DateTime(2025));
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Uint8List? imgPath;

  Future<void> uploadImage2Screen(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      setState(() {
        imgPath = bytes;
      });
    }
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
      appBar: AppBar(
          backgroundColor: cornflowerblue,
          leading: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(
              "assets/img/White Logo Icon.png",
              width: 80.w,
              height: 80.h,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set up your Profile",
                  style: TextStyle(
                      fontFamily: "Montserrat", color: white, fontSize: 23.sp),
                ),
                const Divider(
                  color: white,
                  thickness: 0.5,
                  endIndent: 25,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 220,
                ),
                Text(
                  "Complete your personal Information’s",
                  style: TextStyle(
                      color: white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w100,
                      fontFamily: "Lato"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                Center(
                  child: Stack(
                    children: [
                      imgPath == null
                          ? CircleAvatar(
                              backgroundColor: white,
                              radius: 71.w,
                            )
                          : CircleAvatar(
                              radius: 71.w,
                              backgroundImage: MemoryImage(imgPath!),
                            ),
                      Positioned(
                        left: 48.r,
                        bottom: 48.r,
                        child: IconButton(
                          onPressed: () {
                            showmodel();
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 65,
                ),
                Center(
                  child: Text(
                    "Uplode a Profile\n        picture",
                    style: TextStyle(
                        color: white,
                        fontFamily: "Montserrat",
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 55,
                ),
                Text(
                  "User Name",
                  style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),
                TextFormFieldWidget(
                  maxLength: null,
                  maxLines: null,
                  hintText: "@johnduo",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: userNameController,
                  suffixIcon: null,
                  onChanged: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                Text(
                  "Date of Birth",
                  style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Birth Date';
                    }
                    return null;
                  },
                  controller: dateController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "DD/MM/YYYY",
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: "Lato"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
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
                    _selectdate();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                Text(
                  "Education/ Occupation",
                  style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),
                TextFormFieldWidget(
                  maxLength: null,
                  maxLines: null,
                  hintText: "High School, Engineer, etc...",
                  validator: null,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: educationController,
                  suffixIcon: null,
                  onChanged: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                Text(
                  "Skill/ Expertise",
                  style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),
                TextFormFieldWidget(
                  maxLength: null,
                  maxLines: null,
                  hintText: "Graphic Design, Programming, etc...",
                  validator: null,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: skillController,
                  suffixIcon: null,
                  onChanged: null,
                  obscureText: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 290,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tell us about yourself",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: cornflowerblue,
                                fontSize: 15),
                          ),
                          const Divider(
                            color: cornflowerblue,
                            thickness: 0.5,
                            endIndent: 25,
                          ),
                          TextFormField(
                            controller: bioController,
                            maxLength: 500,
                            maxLines: 7,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white)),
                              hintText:
                                  "Share a short description so others can know you better.... ",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                  fontFamily: "Lato"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElvatedButtonWidget(
                      text: 'Next',
                      onPressed: () {
                        Provider.of<EditProfileProvider>(context, listen: false)
                            .setUpProfile(
                                newsubName: userNameController.text,
                                newBio: bioController.text,
                                newEducation: educationController.text,
                                newSkill: skillController.text,
                                newDateOfBirth: dateController.text,
                                newImgpath: imgPath ?? Uint8List(8));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Interestselection(),
                            ));
                      },
                      color: white,
                      backgroundColor: WidgetStatePropertyAll(green),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
