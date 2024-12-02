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
            const Padding(padding: EdgeInsets.only(top: 10)),
            Image.asset(
              "assets/img/ytylogo.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: 300,
              height: 310,
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
                                            fontSize: 16,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
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
                                          const WidgetStatePropertyAll(cornflowerblue),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7))),
                                    ),
                                    child: const Text(
                                      "Resend",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ]
                        
        )                                       
                    )
                    ),
                    )
              ]
              )
        )
                    );
                                
  }
  }

