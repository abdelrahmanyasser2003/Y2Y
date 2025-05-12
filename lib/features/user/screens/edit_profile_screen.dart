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
import 'package:y2y/core/styling/app_styles.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/user/provider/get_user_provider.dart';
import 'package:y2y/features/user/provider/update_user_provider.dart';
import 'package:y2y/features/user/widges/elvated_button__profile_widget.dart';

class EditProfileScreen extends StatefulWidget {
  final String education;
  final String skill;
  final dynamic imgPath;
  final String firstName;
  final String lastName;
  final String phone;
  final String subname;
  final String bio;
  final String gender;
  final String dateOfBirth;
  final String street;
  final String state;
  final String city;
  final String interests;

  const EditProfileScreen({
    super.key,
    required this.education,
    required this.interests,
    required this.skill,
    required this.phone,
    required this.bio,
    required this.imgPath,
    required this.firstName,
    required this.lastName,
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
  late TextEditingController nameController;
  late TextEditingController subnameController;
  late TextEditingController genderController;
  late TextEditingController dateController;
  late TextEditingController stateController;
  late TextEditingController phoneController;
  late TextEditingController streetController;
  late TextEditingController cityController;
  late TextEditingController bioController;
  late TextEditingController interestsController;
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

  bool isEditing = false;
  bool isEditing1 = false;

  @override
  void initState() {
    super.initState();
    imagePath = widget.imgPath; // تحميل الصورة المحفوظة في البروفايل

    // Initialize controllers with the existing user data
    nameController = TextEditingController(text: '${widget.firstName}');
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
    interestsController = TextEditingController(text: widget.interests);
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
    interestsController.dispose();
    super.dispose();
  }

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
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  dynamic imagePath;

  Future<void> uploadImage2Screen(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      setState(() {
        imagePath = bytes;
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
    final updateUserProvider = Provider.of<UpdateUserProvider>(context);
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
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: imagePath == null
                            ? null // إذا مفيش صورة، خلي الخلفية بيضاء
                            : imagePath is String &&
                                    imagePath.startsWith('http')
                                ? NetworkImage(imagePath) // صورة من URL
                                : imagePath is String
                                    ? NetworkImage(
                                        '${ApiEndpoints.baseUrl}${imagePath.replaceAll("\\", "/")}')
                                    : imagePath is Uint8List
                                        ? MemoryImage(
                                            imagePath) // صورة من الجهاز
                                        : null, // لو النوع غير معروف
                      ),
                      Positioned(
                        left: 26,
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
            hieghtspace(hieght: 10),
            Text("Education/ Occupation",
                style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              colors: cornflowerblue,
              controller: educationController,
              width: double.infinity,
            ),
            hieghtspace(hieght: 10),
            Text("Skill/ Expertise", style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              colors: cornflowerblue,
              width: double.infinity,
              controller: skillController,
            ),
            hieghtspace(hieght: 10),
            Text("Phone Number", style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              colors: cornflowerblue,
              width: double.infinity,
              controller: phoneController,
            ),
            hieghtspace(hieght: 10),
            Text("Interests", style: AppStyles().monwhite16w600style),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              colors: cornflowerblue,
              width: double.infinity,
              controller: interestsController,
            ),
            hieghtspace(hieght: 30),

            ElvatedButtonPrfileWidget(
              height: 50,
              onPressed: () async {
                if (updateUserProvider.isLoading) return;

                File? imageFile;
                if (imagePath != null && imagePath is Uint8List) {
                  imageFile = await convertUint8ListToFile(
                      imagePath as Uint8List,
                      'profile_${DateTime.now().millisecondsSinceEpoch}.jpg');
                }

                final address = {
                  'state':
                      selectedState != "State" ? selectedState : widget.state,
                  'city': cityController.text.isNotEmpty
                      ? cityController.text
                      : widget.city,
                  'street': streetController.text.isNotEmpty
                      ? streetController.text
                      : widget.street,
                };

                final interested = interestsController.text.isNotEmpty
                    ? interestsController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList()
                    : widget.interests.split(',').map((e) => e.trim()).toList();

                try {
                  await updateUserProvider.updateFullProfile(
                    firstName: nameController.text.isNotEmpty
                        ? nameController.text
                        : widget.firstName,
                    lastName: nameController.text.isNotEmpty
                        ? nameController.text
                        : widget.lastName,
                    address: address,
                    phone: phoneController.text.isNotEmpty
                        ? phoneController.text
                        : widget.phone,
                    bD: dateController.text.isNotEmpty
                        ? dateController.text
                        : widget.dateOfBirth,
                    bio: bioController.text.isNotEmpty
                        ? bioController.text
                        : widget.bio,
                    gender: dropdwonvalue != "Gender"
                        ? dropdwonvalue
                        : widget.gender,
                    userName: subnameController.text.isNotEmpty
                        ? subnameController.text
                        : widget.subname,
                    interested: interested,
                    imageFile: imageFile,
                  );

                  await userProvider.fetchUserProfile();

                  if (mounted) {
                    showAnimatedSnackDialog(
                      context,
                      message: 'Updated successfully',
                      type: AnimatedSnackBarType.success,
                    );
                    Navigator.pop(context);
                  }
                } catch (e) {
                  if (mounted) {
                    showAnimatedSnackDialog(
                      context,
                      message: 'Update failed, try again',
                      type: AnimatedSnackBarType.error,
                    );
                  }
                }
              },
              text: updateUserProvider.isLoading
                  ? 'Save Changes...'
                  : 'Save Changes',
              fontSize: 20,
              color: white,
              width: double.infinity,
            ),
            hieghtspace(hieght: 20),
          ],
        ),
      ),
    );
  }
}
