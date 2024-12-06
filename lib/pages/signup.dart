import 'package:flutter/material.dart';
import 'package:y2y/sherd/colors.dart';
import 'package:email_validator/email_validator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isvisablee = true;
  final _formKey = GlobalKey<FormState>();
  String dropdwonvalue = "Gender";
  final List<String> _dropdowngender = ["Gender", "Male", "Femele"];
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 1)),
              Image.asset(
                "assets/img/ytylogo.png",
                width: 150,
                height: 150,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 0),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 330,
                  height: 680,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 30,
                            color: cornflowerblue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: "Lato"),
                              enabledBorder: OutlineInputBorder(
                                borderSide: Divider.createBorderSide(context),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter  Number';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: "Lato"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            return value != null &&
                                    !EmailValidator.validate(value)
                                ? "Enter a valid email"
                                : null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: "Lato"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: SizedBox(
                                  width: 90,
                                  height: 50,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'required ';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "Street",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "Lato"),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            Divider.createBorderSide(context),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.all(8),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  width: 90,
                                  height: 50,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'required ';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "City",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "Lato"),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            Divider.createBorderSide(context),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.all(8),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    width: 90,
                                    height: 60,
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
                                          dropdwonvalue = value!;
                                        });
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ]),
                        const SizedBox(
                          height: 8,
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          validator: (value) {
                            return value!.length < 8
                                ? "Enter at least 6 characters"
                                : null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: isvisablee ? true : false,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: "Lato"),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isvisablee = !isvisablee;
                                  });
                                },
                                icon: isvisablee
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            suffixIconColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          obscureText: isvisablee ? true : false,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Confirm Password ",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: "Lato"),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isvisablee = !isvisablee;
                                  });
                                },
                                icon: isvisablee
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            suffixIconColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  const WidgetStatePropertyAll(green),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontSize: 19,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: cornflowerblue,
                                    fontSize: 15,
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
            ],
          ),
        ),
      ),
    );
  }
}
