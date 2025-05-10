import 'dart:io';
import 'dart:typed_data';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path; // مكتبة المسارات
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/utils/animated_snack_dialog.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Bottom%20Navigation%20Bar/screens/home_screen.dart';
import 'package:y2y/features/Opportunities/provider/new_opportunity_provider.dart';

class Newopportunitie extends StatefulWidget {
  const Newopportunitie({super.key});

  @override
  State<Newopportunitie> createState() => _NewopportunitieState();
}

class _NewopportunitieState extends State<Newopportunitie> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController opportunitytitlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController companycontroller = TextEditingController();
  TextEditingController responsibilitiescontroller = TextEditingController();
  TextEditingController durationcontroller = TextEditingController();
  TextEditingController applicationdeadlinecontroller = TextEditingController();
  TextEditingController requirementscontroller = TextEditingController();
  TextEditingController linkcontroller = TextEditingController();

  bool isbuttonenabled = false;
  validateform() {
    setState(() {
      isbuttonenabled = _formKey.currentState?.validate() ?? false;
    });
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
        applicationdeadlinecontroller.text = picked.toString().split(" ")[0];
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
    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Form(
            key: _formKey,
            onChanged: validateform,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Post New Opportunity",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: white,
                        fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        color: white,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Opportunity Title",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormFieldWidget(
                        controller: opportunitytitlecontroller,
                        onChanged: null,
                        hintText: "Front-End Internship,etc",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Opportunity Title';
                          }
                          return null;
                        },
                        suffixIcon: null,
                        obscureText: null,
                        keyboardType: TextInputType.text,
                        maxLength: null,
                        maxLines: null,
                        textInputAction: TextInputAction.next),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Stack(
                    children: [
                      imgPath == null
                          ? const CircleAvatar(
                              backgroundColor: white,
                              radius: 50,
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: MemoryImage(imgPath!),
                            ),
                      Positioned(
                        left: 28,
                        bottom: 25,
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
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Opportunity Link",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFieldWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter opportunity link';
                  }
                  return null;
                },
                hintText: "opportunity link",
                controller: linkcontroller,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Company",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormFieldWidget(
                    controller: companycontroller,
                    onChanged: null,
                    hintText: "Name of company or organization...",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                    suffixIcon: null,
                    obscureText: null,
                    keyboardType: TextInputType.text,
                    maxLength: null,
                    maxLines: null,
                    textInputAction: TextInputAction.next),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Description",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFieldWidget(
                  controller: descriptioncontroller,
                  onChanged: null,
                  hintText: "Describe this opportunity...",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                  suffixIcon: null,
                  obscureText: null,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next),
              SizedBox(
                height: 15,
              ),
              Text(
                "Responsibilities",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: TextFormFieldWidget(
                    controller: responsibilitiescontroller,
                    onChanged: null,
                    hintText:
                        "Describe the Responsibilities this opportunity...",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter responsibilities';
                      }
                      return null;
                    },
                    suffixIcon: null,
                    obscureText: null,
                    keyboardType: TextInputType.text,
                    maxLength: null,
                    maxLines: 4,
                    textInputAction: TextInputAction.next),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Requirements",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: TextFormFieldWidget(
                    controller: requirementscontroller,
                    onChanged: null,
                    hintText:
                        "Describe the Responsibilities this opportunity...",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Requirements:';
                      }
                      return null;
                    },
                    suffixIcon: null,
                    obscureText: null,
                    keyboardType: TextInputType.text,
                    maxLength: null,
                    maxLines: 4,
                    textInputAction: TextInputAction.next),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Duration",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFieldWidget(
                  controller: durationcontroller,
                  onChanged: null,
                  hintText: "Full-time Position, Part-time Position, etc...",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Duration';
                    }
                    return null;
                  },
                  suffixIcon: null,
                  obscureText: null,
                  keyboardType: TextInputType.text,
                  maxLength: null,
                  maxLines: null,
                  textInputAction: TextInputAction.next),
              SizedBox(
                height: 15,
              ),
              Text(
                "Application Deadline",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Application Deadline';
                  }
                  return null;
                },
                controller: applicationdeadlinecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "DD/MM/YYYY",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "Lato"),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElvatedButtonWidget(
                  text: 'Submit',
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (imgPath != null) {
                        final provider = Provider.of<CreateOpportunityProvider>(
                            context,
                            listen: false);

                        // تحويل الـ imgPath من نوع Uint8List إلى File
                        File imageFile = await convertUint8ListToFile(imgPath!,
                            'image.jpg'); // تغيير 'image.jpg' حسب الحاجة

                        // إرسال البيانات إلى الـ provider
                        await provider.createOpportunity(
                          title: opportunitytitlecontroller.text,
                          deadline: applicationdeadlinecontroller.text,
                          description: descriptioncontroller.text,
                          company: companycontroller.text,
                          responsibilities: responsibilitiescontroller.text,
                          requirements: requirementscontroller.text,
                          duration: durationcontroller.text,
                          link: linkcontroller.text, // غيّرها حسب الحاجة
                          imageFile: imageFile, // تم تحويل الصورة إلى File
                        );

                        // التحقق من حالة الاستجابة
                        if (provider.errorMessage == null) {
                          // تم بنجاح
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                        } else {
                          // فيه خطأ
                          showAnimatedSnackDialog(
                            context,
                            message: provider.errorMessage!,
                            type: AnimatedSnackBarType.error,
                          );
                        }
                      } else {
                        showAnimatedSnackDialog(
                          context,
                          message: 'Please choose an image',
                          type: AnimatedSnackBarType.warning,
                        );
                      }
                    }
                  },
                  color: white,
                  backgroundColor: WidgetStatePropertyAll(green),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
