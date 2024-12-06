import 'package:flutter/material.dart';
import 'package:y2y/pages/homepagecontent.dart';
import 'package:y2y/pages/signup.dart';
import 'package:y2y/sherd/colors.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isvisablee = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 1)),
            Image.asset(
              "assets/img/ytylogo.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 329,
                  height: 395,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 30,
                            color: cornflowerblue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (value) {
                              return value != null &&
                                      !EmailValidator.validate(value)
                                  ? "Enter a valid email"
                                  : null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Email or Phone Number ",
                              hintStyle: const TextStyle(
                                  fontFamily: "Lato",
                                  color: Colors.grey,
                                  fontSize: 12),
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
                            return value!.length < 8
                                ? "Enter at least 6 characters"
                                : null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.done,
                          obscureText: isvisablee ? true : false,
                          decoration: InputDecoration(
                            hintText: "Password ",
                            hintStyle: const TextStyle(
                                fontFamily: "Lato",
                                color: Colors.grey,
                                fontSize: 12),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/Forgetpassword");
                              },
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    color: cornflowerblue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Homepagecontent(),
                                  ));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  const WidgetStatePropertyAll(green),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: white,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage())),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Create a New Account ?",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontFamily: "Lato",
                                    color: cornflowerblue,
                                    fontSize: 15,
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
    );
  }
}
