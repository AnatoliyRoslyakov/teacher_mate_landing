import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/resource/jpgs.dart';
import 'package:teacher_mate_landing/section/bottom_bar_section.dart';
import 'package:teacher_mate_landing/section/first_section.dart';
import 'package:teacher_mate_landing/section/four_section.dart';
import 'package:teacher_mate_landing/section/second_section.dart';
import 'package:teacher_mate_landing/section/three_section.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
import 'package:teacher_mate_landing/section/app_bar_section.dart';
import 'package:teacher_mate_landing/widget/phone_mockup.dart';

class TeacherMateLanding extends StatefulWidget {
  const TeacherMateLanding({super.key});

  @override
  State<TeacherMateLanding> createState() => _TeacherMateLandingState();
}

class _TeacherMateLandingState extends State<TeacherMateLanding> {
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0;
  double opacity = 1;
  double blurIntensity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        setState(() {
          scrollPosition = _scrollController.position.pixels;
          opacity = (1 - scrollPosition / 300).clamp(0.0, 1.0);
          blurIntensity = (scrollPosition / 1000).clamp(0.0, 10.0);
        });
      });

      // Pre-cache images for smooth animations
      precacheImage(AssetImage(Pngs.phoneMocup1), context);
      precacheImage(AssetImage(Pngs.phoneMocup2), context);
      precacheImage(AssetImage(Pngs.macbookMockup1), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    log(screenSize.width.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBarSection(opacity: opacity, blurIntensity: blurIntensity),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            AppLayoutItemBuilder(
              wide: () => PhoneMockupWidget(scrollPosition: scrollPosition),
              narrow: () => SizedBox.shrink(),
            ).call(context),

            Column(
              children: [
                FirstSection(
                  screenSize: screenSize,
                  opacity: opacity,
                  scrollPosition: scrollPosition,
                ),
                SecondSection(scrollPosition: scrollPosition),
                ThreeSection(
                  screenSize: screenSize,
                  scrollPosition: scrollPosition,
                ),
                FourSection(),
                // Footer
                BottomBarSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
