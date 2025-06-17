import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/resource/jpgs.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';
import 'package:teacher_mate_landing/widget/teacher_student_content.dart';

class ThreeSection extends StatelessWidget {
  const ThreeSection({
    super.key,
    required this.screenSize,
    required this.scrollPosition,
  });

  final Size screenSize;
  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 0 : 60),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isSmall ? 10 : 20),
              height: screenSize.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(isSmall ? 30 : 100),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.mainColor.withOpacity(0.4),
                    AppColors.mainColor.withOpacity(0.1),
                  ],
                ),
              ),
              child: TeacherStudentContent(
                title: S.of(context).threeSectionStudent,
                titleStyle: AppTextStyle.b7f46.copyWith(
                  fontSize: 300,
                  color: AppColors.pink.withOpacity(0.2),
                ),
                scrollPosition: scrollPosition,
                image: Pngs.student,
                imageOnLeft: true,
                children: [
                  _TextSection(
                    color: AppColors.pink,
                    text: S.of(context).threeSectionStudentMessage,
                  ),
                  isSmall
                      ? Column(
                        spacing: 10,
                        children: [
                          AppButton(
                            small: true,
                            bgColor: AppColors.mainColor,
                            border: false,
                            color: AppColors.mainColor,
                            text: S.of(context).tgButton,
                            onPressed: () {},
                          ),

                          AppButton(
                            small: true,
                            bgColor: AppColors.mainColor,
                            color: AppColors.mainColor,
                            text: S.of(context).vkButton,
                            onPressed: () {},
                            border: false,
                          ),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AppButton(
                              small: true,
                              bgColor: AppColors.mainColor,
                              border: false,
                              color: AppColors.mainColor,
                              text: S.of(context).tgButton,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: AppButton(
                              small: true,
                              bgColor: AppColors.mainColor,
                              color: AppColors.mainColor,
                              text: S.of(context).vkButton,
                              onPressed: () {},
                              border: false,
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isSmall ? 10 : 20),
              height: screenSize.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(isSmall ? 30 : 100),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.pink.withOpacity(0.4),
                    AppColors.pink.withOpacity(0.1),
                  ],
                ),
              ),
              child: TeacherStudentContent(
                title: S.of(context).threeSectionTeacher,
                titleStyle: AppTextStyle.b7f46.copyWith(
                  fontSize: 300,
                  color: AppColors.mainColor.withOpacity(0.1),
                ),
                scrollPosition: scrollPosition,
                image: Pngs.teacher,
                imageOnLeft: false,
                children: [
                  _TextSection(
                    color: AppColors.mainColor,
                    size: 30,
                    text: S.of(context).threeSectionTeacherMessage,
                  ),
                  isSmall
                      ? Column(
                        spacing: 10,
                        children: [
                          AppButton(
                            small: true,
                            bgColor: AppColors.pink,
                            color: AppColors.pink,
                            text: 'Android',
                            onPressed: () {},
                            icon: Icon(Icons.android, color: AppColors.pink),
                            border: false,
                          ),

                          AppButton(
                            small: true,
                            color: AppColors.pink,
                            bgColor: AppColors.pink,
                            text: 'Apple',
                            onPressed: () {},
                            icon: Icon(Icons.apple, color: AppColors.pink),
                            border: false,
                          ),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AppButton(
                              small: true,
                              bgColor: AppColors.pink,
                              color: AppColors.pink,
                              text: 'Android',
                              onPressed: () {},
                              icon: Icon(Icons.android, color: AppColors.pink),
                              border: false,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: AppButton(
                              small: true,
                              color: AppColors.pink,
                              bgColor: AppColors.pink,
                              text: 'Apple',
                              onPressed: () {},
                              icon: Icon(Icons.apple, color: AppColors.pink),
                              border: false,
                            ),
                          ),
                        ],
                      ),
                  _TextSection(
                    color: AppColors.mainColor,
                    size: 30,
                    text: S.of(context).threeSectionTeacherMessageTwo,
                  ),
                  isSmall
                      ? Column(
                        spacing: 10,
                        children: [
                          AppButton(
                            small: true,
                            bgColor: AppColors.pink,
                            border: false,
                            color: AppColors.pink,
                            text: S.of(context).tgButton,
                            onPressed: () {},
                          ),

                          AppButton(
                            small: true,
                            bgColor: AppColors.pink,
                            color: AppColors.pink,
                            text: S.of(context).vkButton,
                            onPressed: () {},
                            border: false,
                          ),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AppButton(
                              small: true,
                              bgColor: AppColors.pink,
                              border: false,
                              color: AppColors.pink,
                              text: S.of(context).tgButton,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: AppButton(
                              small: true,
                              bgColor: AppColors.pink,
                              color: AppColors.pink,
                              text: S.of(context).vkButton,
                              onPressed: () {},
                              border: false,
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  final String text;
  final double? size;
  final Color color;
  const _TextSection({
    super.key,
    required this.text,
    this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            style: AppTextStyle.b7f46.copyWith(
              color: color.withOpacity(0.8),
              height: 1,
              fontSize: isSmall ? 22 : size,
            ),
          ),
        ),
      ],
    );
  }
}
