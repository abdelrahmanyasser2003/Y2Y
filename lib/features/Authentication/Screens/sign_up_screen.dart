import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/features/Authentication/provider/verify_email_provider.dart';
import 'package:y2y/features/Authentication/repo/signup_services.dart';
import 'package:y2y/features/Authentication/widges/apper_logo_auth_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/features/Authentication/Screens/log_in_screen.dart';
import 'package:y2y/features/Authentication/widges/icon_button_widget.dart';
import 'package:y2y/features/user/provider/edit_profile_provider.dart';



class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isbuttonenabled = false;
  validateform() {
    setState(() {
      isbuttonenabled = _formKey.currentState?.validate() ?? false;
    });
  }

  bool hasUppercase = false;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController streercontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordpassword = TextEditingController();
  bool isvisablee = true;
  bool isvisablee1 = true;

  final _formKey = GlobalKey<FormState>();
  String dropdwonvalue = "Gender";
  final List<String> _dropdowngender = ["Gender", "male", "femele"];
  String dropdwonvaluestate = "State";
  final List<String> _dropdownstate = [
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
    "	بني سويف",
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
    "	كفر الشيخ",
    "مطروح",
    "المنوفية",
    "المنيا",
    "الوادي الجديد"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ApperLogoAuthWidget(),
                  IconButtonWidget(),
                
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: 330.w,
                height: 550.h,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10.r)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 30.sp,
                              color: cornflowerblue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormFieldWidget(
                                width: 140.w,
                                controller: namecontroller,
                                onChanged: (value) => validateform(),
                                hintText: 'First name',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your First name';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                              ),
                              TextFormFieldWidget(
                                width: 140.w,
                                controller: lastnamecontroller,
                                onChanged: (value) => validateform(),
                                hintText: 'Last name',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Last name';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          TextFormFieldWidget(
                            maxLength: null,
                            maxLines: null,
                            controller: phonecontroller,
                            onChanged: (value) => validateform(),
                            hintText: 'Phone Number',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Phone Number';
                              }
                              return null;
                            },
                            suffixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          TextFormFieldWidget(
                            maxLength: null,
                            maxLines: null,
                            controller: emailcontroller,
                            onChanged: (value) => validateform(),
                            hintText: 'Email',
                            validator: (email) {
                              return email!.contains(RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                                  ? null
                                  : "Enter a valid Email";
                            },
                            suffixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          Row(children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: SizedBox(
                                    width: 90.w,
                                    height: 50.h,
                                    child: TextFormFieldWidget(
                                      maxLength: null,
                                      maxLines: null,
                                      controller: streercontroller,
                                      onChanged: (value) => validateform(),
                                      hintText: 'Streer',
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'required ';
                                        }
                                        return null;
                                      },
                                      suffixIcon: null,
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    width: 90.w,
                                    height: 50.h,
                                    child: TextFormFieldWidget(
                                      maxLength: null,
                                      maxLines: null,
                                      controller: citycontroller,
                                      onChanged: (value) => validateform(),
                                      hintText: 'City',
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'required ';
                                        }
                                        return null;
                                      },
                                      suffixIcon: null,
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SizedBox(
                                      width: 90.w,
                                      height: 60.h,
                                      child: DropdownButton(
                                        isExpanded: true,
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
                                        ),
                                        style: const TextStyle(
                                            fontFamily: "Lato",
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                        dropdownColor: white,
                                        value: dropdwonvaluestate,
                                        items: _dropdownstate.map((state) {
                                          return DropdownMenuItem(
                                            value: state,
                                            child: Text(state),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            dropdwonvaluestate = value!;
                                          });
                                        },
                                      ),
                                    ))
                              ],
                            ),
                          ]),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 250,
                          ),
                          DropdownButton(
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          TextFormFieldWidget(
                            maxLength: null,
                            maxLines: null,
                            controller: passwordcontroller,
                            onChanged: (value) => validateform(),
                            hintText: 'Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter your password";
                              }
                              if (value.length < 8) {
                                return "password must be at least 6 characters long";
                              }
                              if (value.contains(RegExp(r'[A-Z]'))) {
                                hasUppercase = true;
                              } else {
                                return "must contain at least one uppercase letter";
                              }
                              if (!value.contains('@')) {
                                return "Password must contain the '@' symbol";
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isvisablee = !isvisablee;
                                  });
                                },
                                icon: isvisablee
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            obscureText: isvisablee ? true : false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          TextFormFieldWidget(
                            maxLength: null,
                            maxLines: null,
                            controller: confirmpasswordpassword,
                            onChanged: (value) => validateform(),
                            hintText: 'Confirm Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please confirm your password";
                              }
                              if (value != passwordcontroller.text) {
                                return "password do not match";
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isvisablee1 = !isvisablee1;
                                  });
                                },
                                icon: isvisablee1
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            obscureText: isvisablee1 ? true : false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElvatedButtonWidget(
                                text: 'Sign Up',
                                onPressed: isbuttonenabled
                                    ? () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          SignUpServices().sendSignData(
                                              firstName: namecontroller.text,
                                              lastName: lastnamecontroller.text,
                                              state: dropdwonvaluestate,
                                              city: citycontroller.text,
                                              phone: phonecontroller.text,
                                              street: streercontroller.text,
                                              gender: dropdwonvalue,
                                              email: emailcontroller.text,
                                              password:
                                                  passwordcontroller.text);

                                          Provider.of<EditProfileProvider?>(
                                                  context,
                                                  listen: false)
                                              ?.loginData(
                                                  newName:
                                                      '${namecontroller.text} ${lastnamecontroller.text}',
                                                  newEmail:
                                                      emailcontroller.text,
                                                  newPhone:
                                                      phonecontroller.text,
                                                  newGender: dropdwonvalue,
                                                  newStreet:
                                                      streercontroller.text,
                                                  newState: dropdwonvaluestate,
                                                  newCity: citycontroller.text);

                                          Provider.of<VerifyEmailProvider>(
                                                  context,
                                                  listen: false)
                                              .setEmail(emailcontroller.text);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ),
                                          );
                                        }
                                      }
                                    : null,
                                color: white,
                                backgroundColor: WidgetStatePropertyAll(green),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: cornflowerblue,
                                      fontSize: 15.sp,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
