import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/features/Become%20a%20Volunteer/screens/Featuer_1_Screen_voulnteer.dart';
import 'package:y2y/features/Become%20a%20Volunteer/screens/Featuer_2_Screen_voulnteer.dart';
import 'package:y2y/features/Become%20a%20Volunteer/screens/Featuer_3_Screen_voulnteer.dart';

class BecomeVolunteer extends StatefulWidget {
  const BecomeVolunteer({super.key});

  @override
  State<BecomeVolunteer> createState() => _BecomeVolunteerState();
}

class _BecomeVolunteerState extends State<BecomeVolunteer> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(),
        ),
      backgroundColor: cornflowerblue,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [Featuer1ScreenVoulnteer(), Featuer2ScreenVoulnteer(), Featuer3ScreenVoulnteer()],
          ),
          Container(
              alignment: Alignment(0, 0.7),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect:
                    WormEffect(dotColor: Colors.white70, activeDotColor: white),
              ))
        ],
      ),
    );
  }
}
