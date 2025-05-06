import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/networking/api_endpoints.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/user/provider/edit_profile_provider.dart';
import 'package:y2y/features/user/provider/get_user_provider.dart';
import 'package:y2y/features/user/provider/update_user_provider.dart';
import 'package:y2y/features/user/widges/elvated_button__profile_widget.dart';

class EditProfileScreen extends StatefulWidget {
  final String education;
  final String skill;
  final String imgpath;
  final String name;
  final String phone;
  final String subname;
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
    required this.phone,
    required this.bio,
    required this.imgpath,
    required this.name,
    required this.subname,
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
  late TextEditingController genderController;
  late TextEditingController dateController;
  late TextEditingController stateController;
  late TextEditingController phoneController;
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

  String? imgPath;
  bool isEditing = false;
  bool isEditing1 = false;

  @override
  void initState() {
    super.initState();
    imgPath = widget.imgpath; // تحميل الصورة المحفوظة في البروفايل

    // Initialize controllers with the existing user data
    nameController = TextEditingController(text: widget.name);
    subnameController = TextEditingController(text: widget.subname);
    genderController = TextEditingController(text: widget.gender);
    dateController = TextEditingController(text: widget.dateOfBirth);
    stateController = TextEditingController(text: widget.state);
    phoneController = TextEditingController(text: widget.phone);
    streetController = TextEditingController(text: widget.street);
    cityController = TextEditingController(text: widget.city);
    bioController = TextEditingController(text: widget.bio);
    educationController = TextEditingController(text: widget.education);
    skillController = TextEditingController(text: widget.skill);
  }

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    dateController.dispose();
    stateController.dispose();
    streetController.dispose();
    cityController.dispose();
    bioController.dispose();
    educationController.dispose();
    skillController.dispose();
    phoneController.dispose();
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
      // في هذه الحالة سنقوم بتخزين المسار أو الرابط للصورة بدلاً من البايتات
      String imagePath = pickedImg.path; // الحصول على مسار الصورة
      setState(() {
        imgPath = imagePath; // تخزين المسار في imgPath
      });
      Navigator.pop(context); // إغلاق المودال بعد اختيار الصورة
    }
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
    final userProvider = Provider.of<GetUserProvider>(context);
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
                      backgroundColor: Colors.white,
                      radius: 50.w,
                      backgroundImage: imgPath != null
                          ? (imgPath!.startsWith('http') ||
                                  imgPath!.startsWith('/uploads')
                              ? NetworkImage(
                                  '${ApiEndpoints.baseUrl}$imgPath') // صورة من النت
                              : FileImage(File(imgPath!))
                                  as ImageProvider) // صورة من الجهاز
                          : AssetImage('assets/img/pic1.jpg')
                              as ImageProvider, // صورة افتراضية
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
                                width: 150.w,
                                child: TextFormField(
                                  controller: nameController,
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16.sp,
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
                            width: 20.w,
                            height: 20.h,
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
                                width: 150.w,
                                child: TextFormField(
                                  controller: subnameController,
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 16.sp,
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
                            width: 20.w,
                            height: 20.h,
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
                          fontSize: 20.sp,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gender", style: AppStyles().monwhite16w600style),
                    hieghtspace(hieght: 5),
                    Container(
                      width: 155,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: white),
                      child: DropdownButton(
                        isExpanded: true,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: cornflowerblue,
                        ),
                        style: const TextStyle(
                            color: cornflowerblue,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Lato"),
                        dropdownColor: white,
                        value: dropdwonvalue,
                        items: _dropdowngender.map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdwonvalue = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date of Birth",
                        style: AppStyles().monwhite16w600style),
                    hieghtspace(hieght: 5),
                    SizedBox(
                      width: 155.w,
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
                    ),
                  ],
                ),
              ],
            ),
            hieghtspace(hieght: 10),

            Text("Adress", style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: streetController,
                  width: 105.w,
                ),
                TextFormFieldWidget(
                  colors: cornflowerblue,
                  controller: cityController,
                  width: 105.w,
                ),
                Container(
                  width: 105.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10.r)),
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
                    value: selectedState,
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
            hieghtspace(hieght: 20),
            Text("Phone Number", style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 10),
            TextFormFieldWidget(
              colors: cornflowerblue,
              width: double.infinity,
              controller: phoneController,
            ),
            hieghtspace(hieght: 30),

            ElvatedButtonPrfileWidget(
              onPressed: () {
                Navigator.pop(context);
                final provider =
                    Provider.of<UpdateUserProvider>(context, listen: false);

                provider.updateUser(
                  firstName: nameController.text,
                  lastName: nameController.text,
                  email: userProvider.user?.email ?? '',
                  address: {
                    "street": streetController.text,
                    "city": cityController.text,
                    "state": stateController.text,
                  },
                  phone: userProvider.user!.phone.toString(),
                  bD: dateController.text,
                  bio: bioController.text,
                  gender: dropdwonvalue,
                  userName: subnameController.text,
                  interested: userProvider.user?.interested ?? [],
                );

                Provider.of<EditProfileProvider>(context, listen: false)
                    .updateProfile(
                        newSubName: subnameController.text,
                        newBio: bioController.text,
                        newCity: cityController.text,
                        newName: nameController.text,
                        newSkill: skillController.text,
                        newEducation: educationController.text,
                        newDateOfBirth: dateController.text,
                        newGender: genderController.text,
                        newStreet: streetController.text,
                        newState: selectedState,
                        newImgpath: imgPath ?? '');
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
