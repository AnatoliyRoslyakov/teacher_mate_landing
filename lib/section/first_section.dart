import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/widget/buttons_group.dart';
import 'package:teacher_mate_landing/widget/title_info.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
    required this.screenSize,
    required this.opacity,
    required this.scrollPosition,
  });

  final Size screenSize;
  final double opacity;
  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.9,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,

                      Color.fromARGB(63, 255, 0, 238),
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: screenSize.width / 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TitleInfoWidget(
                              scrollPosition: scrollPosition,
                              opacity: opacity,
                            ),
                            SizedBox(height: 60),
                            ButtonsGroupWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
