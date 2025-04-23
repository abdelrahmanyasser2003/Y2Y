import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/features/Opening%20Screens/Screens/featuer_1_screen.dart';
import 'package:y2y/features/Opening%20Screens/Screens/featuer_2_screen.dart';
import 'package:y2y/features/Opening%20Screens/Screens/featuer_3_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cornflowerblue,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [Featuer1Screen(), Featuer2Screen(), Featuer3Screen()],
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
