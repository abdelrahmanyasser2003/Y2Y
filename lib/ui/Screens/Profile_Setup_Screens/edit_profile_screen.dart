import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/app_colors.dart';
import 'package:y2y/core/app_styles.dart';
import 'package:y2y/core/spaceing_widges.dart';
import 'package:y2y/model/user_detils_model.dart';
import 'package:y2y/provider/edit_profile_provider.dart';
import 'package:y2y/provider/profile_provider.dart';
import 'package:y2y/provider/user_details_provider.dart';
import 'package:y2y/ui/Widges/app_bar_widget.dart';
import 'package:y2y/ui/Widges/elvated_button__profile_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  final String education;
  final String skill;
  final Uint8List imgpath;
  final String name;
  final String subname;
  final String email;
  final String phone;
  final String bio;
  final String gender;
  final String dateOfBirth;
  final String street;
  final String state;
  final String city;

  const EditProfileScreen({
    super.key,
    required this.education,
    required this.skill,
    required this.bio,
    required this.imgpath,
    required this.name,
    required this.subname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
    required this.city,
    required this.state,
    required this.street,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Text Controllers
  late TextEditingController nameController;
  late TextEditingController subnameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController genderController;
  late TextEditingController dateController;
  late TextEditingController stateController;
  late TextEditingController streetController;
  late TextEditingController cityController;
  late TextEditingController bioController;
  late TextEditingController educationController;
  late TextEditingController skillController;

  String selectedState = "State";
  final List<String> _states = [
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
    "بني سويف",
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
    "كفر الشيخ",
    "مطروح",
    "المنوفية",
    "المنيا",
    "الوادي الجديد"
  ];
  String dropdwonvalue = "Gender";
  final List<String> _dropdowngender = ["Gender", "Male", "Femele"];

  Uint8List? imgPath;
  bool isEditing = false;
  bool isEditing1 = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the existing user data
    nameController = TextEditingController(text: widget.name);
    subnameController = TextEditingController(text: widget.subname);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
    genderController = TextEditingController(text: widget.gender);
    dateController = TextEditingController(text: widget.dateOfBirth);
    stateController = TextEditingController(text: widget.state);
    streetController = TextEditingController(text: widget.street);
    cityController = TextEditingController(text: widget.city);
    bioController = TextEditingController(text: widget.bio);
    educationController = TextEditingController(text: widget.education);
    skillController = TextEditingController(text: widget.skill);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    dateController.dispose();
    stateController.dispose();
    streetController.dispose();
    cityController.dispose();
    bioController.dispose();
    educationController.dispose();
    skillController.dispose();
    subnameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> uploadImage(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      setState(() {
        imgPath = bytes;
      });
      Navigator.pop(context); // Close the modal after picking the image
    }
  }

  @override
  void initStatee() {
    super.initState();
    imgPath = widget.imgpath; // تحميل الصورة المحفوظة في البروفايل
  }

  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: skyblue,
          padding: EdgeInsets.all(10),
          height: 125.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Icons.camera, size: 30),
                title: Text("From Camera", style: TextStyle(fontSize: 20.sp)),
                onTap: () => uploadImage(ImageSource.camera),
              ),
              ListTile(
                leading: Icon(Icons.photo_outlined, size: 30),
                title: Text("From Gallery", style: TextStyle(fontSize: 20.sp)),
                onTap: () => uploadImage(ImageSource.gallery),
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: white,
                      radius: 50.w,
                      backgroundImage: (imgPath != null)
                          ? MemoryImage(
                              imgPath!) // الصورة الجديدة التي اختارها المستخدم
                          : (widget.imgpath.isNotEmpty
                              ? MemoryImage(
                                  widget.imgpath) // الصورة القادمة من البروفايل
                              : null), // لا تعرض أي صورة إذا لم تكن هناك بيانات
                      child: (widget.imgpath.isEmpty && imgPath == null)
                          ? Icon(Icons.person,
                              size: 50, color: Colors.grey) // صورة افتراضية
                          : null,
                    ),
                    Positioned(
                      left: 26.r,
                      bottom: 28.r,
                      child: IconButton(
                        onPressed: showImagePicker,
                        icon:
                            Icon(Icons.add_photo_alternate_outlined, size: 25),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Widthspace(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isEditing
                            ? SizedBox(
                                width: 150,
                                child: TextFormField(
                                  controller: nameController,
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                            : Text(nameController.text,
                                style: AppStyles().monwhite16w600style),
                        Widthspace(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEditing = !isEditing; // تبديل حالة التعديل
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: white, width: 1),
                            ),
                            child: Icon(
                              isEditing ? Icons.check : Icons.edit,
                              color: white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        isEditing1
                            ? SizedBox(
                                width: 150,
                                child: TextFormField(
                                  controller: subnameController,
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                            : Text(subnameController.text,
                                style: AppStyles().robwhite16w600style),
                        Widthspace(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEditing1 = !isEditing1; // تبديل حالة التعديل
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: white, width: 1),
                            ),
                            child: Icon(
                              isEditing1 ? Icons.check : Icons.edit,
                              color: white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            hieghtspace(hieght: 20),
            Divider(color: button, thickness: 1),

            // About Me Section
            Container(
              height: 142.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About me",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: cornflowerblue),
                    ),
                    Divider(
                      color: cornflowerblue,
                      thickness: 0.5,
                    ),
                    TextFormField(
                      style: TextStyle(color: cornflowerblue),
                      controller: bioController,
                      maxLength: 300,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            hieghtspace(hieght: 10),
            Row(
              children: [
                hieghtspace(hieght: 30),
                Text("Email", style: AppStyles().monwhite16w600style),
                Widthspace(width: 140),
                Text("Phone Number", style: AppStyles().monwhite16w600style),
              ],
            ),

            // Email & Phone Fields
            Row(
              children: [
                TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: emailController,
                  width: 175,
                ),
                Widthspace(width: 10),
                TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: phoneController,
                  width: 155,
                ),
              ],
            ),
            hieghtspace(hieght: 10),

            // Gender & Date of Birth
            Row(
              children: [
                hieghtspace(hieght: 30),
                Text("Gender", style: AppStyles().monwhite16w600style),
                Widthspace(width: 125),
                Text("Date of Birth", style: AppStyles().monwhite16w600style),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 175.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
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
                    value: widget.gender,
                    items: _dropdowngender.map((state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdwonvalue = value!;
                      });
                    },
                  ),
                ),
                Widthspace(width: 10),
                SizedBox(
                  width: 155,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Birth Date';
                      }
                      return null;
                    },
                    controller: dateController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: cornflowerblue),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
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
                      _selectDate();
                    },
                  ),
                ),
              ],
            ),
            hieghtspace(hieght: 10),

            // State Dropdown

            Text("Adress", style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: streetController,
                  width: 105,
                ),
                TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: cityController,
                  width: 105,
                ),
                Container(
                  width: 105.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: cornflowerblue,
                    ),
                    style: const TextStyle(
                        fontFamily: "Lato",
                        color: cornflowerblue,
                        fontWeight: FontWeight.w500),
                    dropdownColor: white,
                    value: widget.state,
                    items: _states.map((state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedState = value!;
                      });
                    },
                  ),
                )
              ],
            ),
            hieghtspace(hieght: 20),
            Text("Education/ Occupation",
                style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 10),
            TextFormFieldWidget(
              colors: cornflowerblue,
              controller: educationController,
              width: double.infinity,
            ),
            hieghtspace(hieght: 20),
            Text("Skill/ Expertise", style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 10),
            TextFormFieldWidget(
              colors: cornflowerblue,
              width: double.infinity,
              controller: skillController,
            ),
            hieghtspace(hieght: 30),

            // Save Button
            ElvatedButtonPrfileWidget(
              onPressed: () {
                Navigator.pop(context);

                // هنا يمكنك حفظ البيانات المدخلة من قبل المستخدم
                Provider.of<EditProfileProvider>(context, listen: false)
                    .updateProfile(
                        newSubName: subnameController.text,
                        newBio: bioController.text,
                        newCity: cityController.text,
                        newName: nameController.text,
                        newSkill: skillController.text,
                        newEducation: educationController.text,
                        newDateOfBirth: dateController.text,
                        newEmail: emailController.text,
                        newPhone: phoneController.text,
                        newGender: genderController.text,
                        newStreet: streetController.text,
                        newState: selectedState,
                        newImgpath: imgPath ?? widget.imgpath);
              },
              text: 'Save Changes',
              color: white,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
