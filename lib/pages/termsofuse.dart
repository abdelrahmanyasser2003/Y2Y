import 'package:flutter/material.dart';
import 'package:y2y/sherd/colors.dart';

class Termsofuse extends StatefulWidget {
  const Termsofuse({super.key});

  @override
  State<Termsofuse> createState() => _TermsofuseState();
}

class _TermsofuseState extends State<Termsofuse> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: AppBar(
          backgroundColor: cornflowerblue,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/img/White Logo Icon.png"),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: const Text(
                "Terms of Use",
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: white),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                width: 329,
                height: 500,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Effective Date: [Insert Date]\n\n'
                          'This Privacy Policy describes how we collect, use, and protect your information when you use our app.\n\n'
                          '1. *Information Collection*:\n'
                          '   - We may collect personal information such as your name, email address, and usage data.\n\n'
                          '2. *Use of Information*:\n'
                          '   - Your information is used to improve user experience, provide customer support, and send updates.\n\n'
                          '3. *Data Security*:\n'
                          '   - We implement measures to ensure the safety of your data, but no method is 100% secure.\n\n'
                          '4. *Sharing of Information*:\n'
                          '   - We do not share your personal information with third parties without your consent unless required by law.\n\n'
                          '5. *Your Rights*:\n'
                          '   - You have the right to access, modify, or delete your personal information.\n\n'
                          'If you have any questions, please contact us at [Insert Contact Email].\n\n'
                          'Thank you for using our app!',
                          style: TextStyle(
                            fontSize: 15,
                            color: cornflowerblue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: ischecked,
                  onChanged: (value) {
                    setState(() {
                    ischecked = value!;
                    });
                  },
                  fillColor: const WidgetStatePropertyAll(white),
                  checkColor: cornflowerblue,
                ),
                const Text("i accept the terms of use\n and policy of privacy",
                    style: TextStyle(fontSize: 12, color: white,fontWeight: FontWeight.bold)),
                    const SizedBox(width: 17,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 110,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/LoginPage");
                      },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(green),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 19,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
