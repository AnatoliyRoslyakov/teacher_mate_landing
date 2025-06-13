import 'package:flutter/material.dart';

class TeacherStudentContent extends StatelessWidget {
  const TeacherStudentContent({
    required this.title,
    required this.titleStyle,
    required this.scrollPosition,
    required this.image,
    required this.children,
    required this.imageOnLeft,
  });

  final String title;
  final TextStyle titleStyle;
  final double scrollPosition;
  final String image;
  final List<Widget> children;
  final bool imageOnLeft;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(title, style: titleStyle),
            ),
          ),
          Flexible(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              transform: Matrix4.translationValues(
                0,
                (-scrollPosition + 2500) * 0.2,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    imageOnLeft
                        ? [
                          Image.asset(image, height: 300),
                          Flexible(
                            child: Column(spacing: 20, children: children),
                          ),
                        ]
                        : [
                          Flexible(
                            child: Column(spacing: 20, children: children),
                          ),
                          Image.asset(image, height: 500),
                        ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
