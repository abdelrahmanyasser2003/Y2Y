import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/elvated_button_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/text_form_field_widget.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';

class SendFeedbackScreen extends StatefulWidget {
  const SendFeedbackScreen({super.key});

  @override
  State<SendFeedbackScreen> createState() => _SendFeedbackScreenState();
}

class _SendFeedbackScreenState extends State<SendFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAndBackWidget(
              text: 'Send Feedback',
            ),
            hieghtspace(hieght: 20),
            Text(
              "Need help or have feedback? Send us your thoughts or issues to help us improve your experience",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 10),
            Text(
              "Subject",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              height: 100,
              maxLines: 2,
              hintText:
                  'Describe your topic (e.g., Technical Issue, Suggestion, etc...)',
            ),
            Text(
              "Message",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20.sp,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            hieghtspace(hieght: 5),
            TextFormFieldWidget(
              height: 200,
              hintText:
                  'Explain your feedback or issue in detail to help us assist you better...',
              maxLines: 7,
              maxLength: 1000,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElvatedButtonWidget(
                  text: 'Send',
                  fontSize: 20,
                  onPressed: () {},
                  backgroundColor: WidgetStatePropertyAll(green),
                  color: white),
            )
          ],
        ),
      ),
    );
  }
}
