import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Become%20a%20Volunteer/models/become_volunteer_model.dart';
import 'package:y2y/features/Become%20a%20Volunteer/provider/become_volunteer_provider.dart';

class RequestBecomeVolunteer extends StatefulWidget {
  const RequestBecomeVolunteer({super.key});

  @override
  State<RequestBecomeVolunteer> createState() => _RequestBecomeVolunteerState();
}

class _RequestBecomeVolunteerState extends State<RequestBecomeVolunteer> {
  TextEditingController skilsController = TextEditingController();
  TextEditingController degreesController = TextEditingController();

  String? frontImageBase64;
  String? backImageBase64;
  bool isFront = true;

  Future<void> uploadImage2Screen(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      String base64String = base64Encode(bytes);
      setState(() {
        if (isFront) {
          frontImageBase64 = base64String;
        } else {
          backImageBase64 = base64String;
        }
      });
    }
    Navigator.pop(context); // إغلاق المودال بعد اختيار الصورة
  }

  void showImagePicker(bool forFront) {
    isFront = forFront;
    showModalBottomSheet(
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
                onTap: () async => await uploadImage2Screen(ImageSource.camera),
                child: Row(
                  children: [
                    const Icon(Icons.camera, size: 30),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Text("From Camera", style: TextStyle(fontSize: 20.sp))
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              GestureDetector(
                onTap: () async =>
                    await uploadImage2Screen(ImageSource.gallery),
                child: Row(
                  children: [
                    const Icon(Icons.photo_outlined, size: 30),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Text("From Gallery", style: TextStyle(fontSize: 20.sp))
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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      backgroundColor: cornflowerblue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Become Volunteer",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20.sp,
                      color: white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    label: Text(
                      'back',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    icon: Icon(Icons.arrow_forward_ios_outlined, color: white),
                    iconAlignment: IconAlignment.end,
                  )
                ],
              ),
              Divider(color: white, thickness: 0.5),
              hieghtspace(hieght: 10),

              // ID Upload
              Text(
                "Verify Your Identity",
                style: TextStyle(
                    fontSize: 20.sp, color: white, fontWeight: FontWeight.w700),
              ),
              hieghtspace(hieght: 5),
              Text(
                "Please upload clear photos of the front and back of your official ID...",
                style: TextStyle(fontSize: 15.sp, color: white),
              ),
              hieghtspace(hieght: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Front Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Front Face",
                          style: TextStyle(fontSize: 15.sp, color: white)),
                      hieghtspace(hieght: 5),
                      Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: frontImageBase64 == null
                            ? IconButton(
                                onPressed: () => showImagePicker(true),
                                icon: Icon(Icons.add_photo_alternate_outlined,
                                    color: Colors.grey),
                              )
                            : Image.memory(
                                base64Decode(frontImageBase64!),
                                fit: BoxFit.cover,
                                width: 160,
                                height: 45,
                              ),
                      ),
                    ],
                  ),
                  Widthspace(width: 20),
                  // Back Image
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Back Face",
                          style: TextStyle(fontSize: 15.sp, color: white)),
                      hieghtspace(hieght: 5),
                      Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: backImageBase64 == null
                            ? IconButton(
                                onPressed: () => showImagePicker(false),
                                icon: Icon(Icons.add_photo_alternate_outlined,
                                    color: Colors.grey),
                              )
                            : Image.memory(
                                base64Decode(backImageBase64!),
                                fit: BoxFit.cover,
                                width: 160,
                                height: 45,
                              ),
                      ),
                    ],
                  ),
                ],
              ),

              hieghtspace(hieght: 25),

              Text("Tell us About You",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: white,
                      fontWeight: FontWeight.w700)),
              hieghtspace(hieght: 5),
              Text(
                "List your skills, qualifications, certificates, or degrees...",
                style: TextStyle(fontSize: 15.sp, color: white),
              ),
              hieghtspace(hieght: 15),

              Text("Skills & Qualifications",
                  style: TextStyle(fontSize: 16.sp, color: white)),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                controller: skilsController,
                hintText: 'Write here...',
                height: 100,
                maxLines: 3,
              ),
              hieghtspace(hieght: 10),

              Text("Certificates & Degrees",
                  style: TextStyle(fontSize: 16.sp, color: white)),
              hieghtspace(hieght: 5),
              TextFormFieldWidget(
                controller: degreesController,
                hintText: 'Write here...',
                height: 100,
                maxLines: 3,
              ),
              hieghtspace(hieght: 20),

              // Submit Button
              Text("Final Step!",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: white,
                      fontWeight: FontWeight.w700)),
              hieghtspace(hieght: 5),
              Text(
                "You're one step away! Submit your details and we'll get back to you soon",
                style: TextStyle(fontSize: 15.sp, color: white),
              ),
              hieghtspace(hieght: 15),

              SizedBox(
                width: double.infinity,
                child: ElvatedButtonWidget(
                  text: 'Submit',
                  onPressed: () async {
                    final provider = Provider.of<BecomeVolunteerProvider>(
                        context,
                        listen: false);
                    final model = BecomeVolunteerModel(
                      frontIdCardImage: frontImageBase64 ?? '',
                      backIdCardImage: backImageBase64 ?? '',
                      education: degreesController.text,
                      skills: skilsController.text.split(','),
                    );
                    final success = await provider.submitVolunteerForm(model);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(success
                              ? "تم الإرسال بنجاح"
                              : "فشل في إرسال الطلب")),
                    );
                  },
                  backgroundColor: const WidgetStatePropertyAll(green),
                  color: white,
                ),
              ),
              hieghtspace(hieght: 5),
            ],
          ),
        ),
      ),
    );
  }
}
