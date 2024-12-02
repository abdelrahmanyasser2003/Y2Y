import 'package:flutter/material.dart';
import 'package:y2y/sherd/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
 int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Padding(padding: EdgeInsets.only(top: 10)),
                      Image.asset(
                        "assets/img/ytylogo.png",
                        width: 150,
                        height: 150,
                      ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                width: 330,
                height: 560,
                decoration:BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10)

                ) ,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sign Up",
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
                          hintText: "Name",
                          hintStyle: const TextStyle(
                              color: cornflowerblue, fontSize: 12),
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
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          hintStyle: const TextStyle(
                              color: cornflowerblue, fontSize: 12),
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
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: cornflowerblue, fontSize: 12),
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
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Gender*",
                            style: TextStyle(
                                color: cornflowerblue, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 9.0,
                          ),
                          Radio(
                            fillColor: const WidgetStatePropertyAll(cornflowerblue),
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value!;
                                });
                              }
                              ),
                          const Text(
                            "Male",
                            style: TextStyle(color: cornflowerblue),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Radio(
                            fillColor: const WidgetStatePropertyAll(cornflowerblue),
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value!;
                                });
                              }),
                          const Text(
                            "Female",
                            style: TextStyle(color: cornflowerblue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: cornflowerblue, fontSize: 12),
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
                          hintText: "Confirm Password ",
                          hintStyle: const TextStyle(
                              color: cornflowerblue, fontSize: 12),
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
                              fontSize: 19,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: cornflowerblue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: skyblue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
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
