import 'package:flutter/material.dart';
import 'package:y2y/sherd/colors.dart';

class Enterthecode extends StatelessWidget {
  const Enterthecode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cornflowerblue,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(padding: EdgeInsets.only(top: 1)),
          Image.asset(
            "assets/img/ytylogo.png",
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            width: 300,
            height: 280,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Enter The Code",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 20,
                              color: cornflowerblue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
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
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  width: 120,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/Resetpassword");
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(green),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7))),
                                    ),
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  width: 110,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "/LoginPage");
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              Color(0xff00000040)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7))),
                                    ),
                                    child: const Text(
                                      "Resend",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          color: Color(0xff3C3C4399),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]))),
          )
        ])));
  }
}
