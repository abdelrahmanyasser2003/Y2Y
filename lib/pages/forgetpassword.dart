import 'package:flutter/material.dart';
import 'package:y2y/sherd/colors.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Padding(padding: EdgeInsets.only(top: 10)),
            Image.asset(
              "assets/img/ytylogo.png",
              width:150,
              height: 150,
            ),
            const SizedBox(height: 80,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: 300,
              height: 310,
              decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Forget Password",
                        style: TextStyle(
                          fontSize: 20,
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
                          hintText: "Enter Your Email or Phone Number ",
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/Enterthecode");

                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            "Send Code",
                            style: TextStyle(
                                fontSize: 19,
                                color: white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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
