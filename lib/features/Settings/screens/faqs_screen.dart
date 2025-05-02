import 'package:flutter/material.dart';
import 'package:y2y/core/styling/app_colors.dart';
import 'package:y2y/core/widges/app_bar_widget.dart';
import 'package:y2y/core/widges/spaceing_widges.dart';
import 'package:y2y/core/widges/title_and_back_widget.dart';
import 'package:y2y/features/Settings/widges/expanded_tile_widget.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(),
        ),
        backgroundColor: cornflowerblue,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              TitleAndBackWidget(
                text: 'FAQs',
              ),
              hieghtspace(hieght: 20),
              ExpandedTileWidget(
                title: 'What is Youth to Youth?',
                subTitle:
                    'Youth to Youth is a platform that connects young people with opportunities, communities, and networks based on their interests and skills. It’s designed to support personal and professional growth through collaboration and shared experiences.',
              ),
              ExpandedTileWidget(
                title: 'Who can join Youth to Youth?',
                subTitle:
                    'Anyone aged 16 to 35 who is looking to explore new opportunities, develop skills, or connect with like-minded individuals is welcome to join, whether youre a student, graduate, or young professional.',
              ),
              ExpandedTileWidget(
                title: 'What kind of opportunities can I find here?',
                subTitle: '',
              ),
              ExpandedTileWidget(
                title: 'How can I become part of a community?',
                subTitle: '',
              ),
              ExpandedTileWidget(
                title: 'Is Youth to Youth a volunteering platform?',
                subTitle: '',
              ),
              ExpandedTileWidget(
                title: 'How can I trust the opportunities listed?',
                subTitle: '',
              ),
              ExpandedTileWidget(
                title: 'Is it free to use the platform?',
                subTitle: '',
              ),
            ]),
          ),
        ));
  }
}
