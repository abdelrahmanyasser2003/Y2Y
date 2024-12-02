import 'package:flutter/material.dart';
import 'package:y2y/pages/signup.dart';
import 'package:y2y/sherd/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            Image.asset(
              "assets/img/ytylogo.png",
              width: 200,
              height: 200,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                width: 329,
                height: 350,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          color: cornflowerblue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Username, email & phone number ",
                          hintStyle: const TextStyle(color: cornflowerblue, fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: cornflowerblue,
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
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password ",
                          hintStyle: const TextStyle(color: cornflowerblue, fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: Divider.createBorderSide(context),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: cornflowerblue,
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
                        style: TextStyle(color: cornflowerblue, fontSize: 12,fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/Homepage");
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
                              fontSize: 19,
                              color: white,
                            ),
                          ),
                        ),
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
                                  color: cornflowerblue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: skyblue,
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
          ],
        ),
      ),
    );
  }
}
