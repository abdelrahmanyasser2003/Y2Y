import 'dart:io';
import 'dart:typed_data';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Become%20a%20Volunteer/models/become_volunteer_model.dart';
import 'package:y2y/features/Become%20a%20Volunteer/provider/become_volunteer_provider.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/screens/home_screen.dart';

class RequestBecomeVolunteer extends StatefulWidget {
  const RequestBecomeVolunteer({super.key});

  @override
  State<RequestBecomeVolunteer> createState() => _RequestBecomeVolunteerState();
}

class _RequestBecomeVolunteerState extends State<RequestBecomeVolunteer> {
  TextEditingController skilsController = TextEditingController();
  TextEditingController degreesController = TextEditingController();

  bool isFront = true;
  Uint8List? frontimgPath;
  Uint8List? backimgPath;

  Future<File> convertUint8ListToFile(Uint8List data, String filename) async {
    final tempDir = await getTemporaryDirectory();
    final file = File(path.join(tempDir.path, filename));
    return await file.writeAsBytes(data);
  }

  Future<void> uploadFrontImage2Screen(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      setState(() {
        frontimgPath = bytes;
      });
    }
  }

  Future<void> uploadBackImage2Screen(ImageSource source) async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      Uint8List bytes = await pickedImg.readAsBytes();
      setState(() {
        backimgPath = bytes;
      });
    }
  }

  showModelFront(BuildContext context) {
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
                  await uploadFrontImage2Screen(ImageSource.camera);
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
                  uploadFrontImage2Screen(ImageSource.gallery);
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

  showModelBack(BuildContext context) {
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
                  await uploadBackImage2Screen(ImageSource.camera);
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
                  uploadBackImage2Screen(ImageSource.gallery);
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
                        child: Stack(
                          children: [
                            frontimgPath == null
                                ? const CircleAvatar(
                                    backgroundColor: white,
                                    radius: 45,
                                  )
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: MemoryImage(frontimgPath!),
                                  ),
                            Positioned(
                              left: 22,
                              bottom: 23,
                              child: IconButton(
                                onPressed: () {
                                  showModelFront(context);
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
                        child: Stack(
                          children: [
                            backimgPath == null
                                ? const CircleAvatar(
                                    backgroundColor: white,
                                    radius: 45,
                                  )
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: MemoryImage(backimgPath!),
                                  ),
                            Positioned(
                              left: 22,
                              bottom: 23,
                              child: IconButton(
                                onPressed: () {
                                  showModelBack(context);
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
                    // التحقق من الصور
                    if (frontimgPath == null || frontimgPath!.isEmpty) {
                      showAnimatedSnackDialog(context,
                          message: 'Please select an image Front Face',
                          type: AnimatedSnackBarType.warning);
                      return;
                    }
                    if (backimgPath == null || backimgPath!.isEmpty) {
                      showAnimatedSnackDialog(context,
                          message: 'Please select an image Back Face',
                          type: AnimatedSnackBarType.warning);
                      return;
                    }

                    try {
                      // تحويل الصور إلى ملفات
                      File frontFace = await convertUint8ListToFile(
                          frontimgPath!, 'front_image.jpg');
                      File backFace = await convertUint8ListToFile(
                          backimgPath!, 'back_image.jpg');

                      // تحضير البيانات
                      final model = BecomeVolunteerModel(
                        frontIdCardImage: frontFace,
                        backIdCardImage: backFace,
                        education: degreesController.text,
                        skills: skilsController.text.split(','),
                      );

                      // استرجاع الـ provider باستخدام Provider.of
                      final provider = Provider.of<BecomeVolunteerProvider>(
                          context,
                          listen: false);

                      // إرسال البيانات عبر الـ Provider
                      await provider.becomeVolunteer(model);

                      // الحصول على نتيجة الإرسال
                      final success = provider
                          .success; // فرض أن الـ Provider يحتوي على حقل success لتحديد النتيجة

                      // عرض النتيجة للمستخدم
                      if (success) {
                        showAnimatedSnackDialog(context,
                            message: 'The request has been sent successfully',
                            type: AnimatedSnackBarType.success);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      } else {
                        showAnimatedSnackDialog(context,
                            message:
                                'An error occurred while sending the request',
                            type: AnimatedSnackBarType.error);
                      }
                    } catch (e) {
                      showAnimatedSnackDialog(context,
                          message: 'An error occurred: ${e.toString()}',
                          type: AnimatedSnackBarType.error);
                    }
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
