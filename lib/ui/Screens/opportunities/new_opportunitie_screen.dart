import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:y2y/model/opportunitys_model.dart';
import 'package:y2y/provider/project.dart';
import 'package:y2y/ui/Widges/elvated_button_widget.dart';
import 'package:y2y/ui/Widges/text_form_field_widget.dart';
import 'package:y2y/ui/widges/app_Bar_Widget.dart';
import 'package:y2y/ui/widges/colors.dart';



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
  String selectedCategory = 'Programming';

  bool isbuttonenabled = false;
  validateform() {
    setState(() {
      isbuttonenabled = _formKey.currentState?.validate() ?? false;
    });
  }

  Future _selectdate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2026));
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

  showmodel() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: skyblue,
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: AppBarWidget()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Post New Opportunity",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: white, fontSize: 20),
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
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      width: 150,
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
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: "Montserrat"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        isExpanded: true,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Lato"),
                        dropdownColor: white,
                        value: selectedCategory,
                        items: <String>[
                          'Programming',
                          'AI',
                          'Data Science',
                          'Web Development',
                          'Cybersecurity',
                          'Accounting'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            selectedCategory = newvalue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
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
            SingleChildScrollView(
              child: TextFormFieldWidget(
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
                  maxLength: 200,
                  maxLines: 4,
                  textInputAction: TextInputAction.next),
            ),
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
                  hintText: "Describe the Responsibilities this opportunity...",
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
                  hintText: "Describe the Responsibilities this opportunity...",
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
                _selectdate();
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElvatedButtonWidget(
                  text: 'Submit',
                  onPressed: () {
                    final opportunity = opportunitydetilsmodel(
                        opportunitytitledetils: opportunitytitlecontroller.text,
                        companymodeldetils: companycontroller.text,
                        requirementsmodeldetils: requirementscontroller.text,
                        descriptionmodeldetils: descriptioncontroller.text,
                        responsibilitiesmodeldetils:
                            responsibilitiescontroller.text,
                        durationmodeldetils: durationcontroller.text,
                        caregory: selectedCategory,
                        imagepath: imgPath ?? Uint8List(0),
                        applicationdeadlinemodeldetils:
                            applicationdeadlinecontroller.text);
                    Provider.of<Project>(context, listen: false)
                        .addopportunity(opportunity);
                    Navigator.pop(context);
                  },
                  color: white,
                  backgroundColor: WidgetStatePropertyAll(green),
                )),
          ]),
        ),
      ),
    );
  }
}
