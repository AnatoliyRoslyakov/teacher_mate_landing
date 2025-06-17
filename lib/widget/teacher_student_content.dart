import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';

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
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: isSmall ? 60 : 150,
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
                (-scrollPosition + (isSmall ? 3300 : 2500)) * 0.2,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    imageOnLeft
                        ? [
                          if (!isSmall) Image.asset(image, height: 300),
                          Flexible(
                            child: Column(spacing: 20, children: children),
                          ),
                        ]
                        : [
                          Flexible(
                            child: Column(spacing: 20, children: children),
                          ),
                          if (!isSmall) Image.asset(image, height: 500),
                        ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
