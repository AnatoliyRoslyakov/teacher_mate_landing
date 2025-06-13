import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/resource/jpgs.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: screenSize.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(100),
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
                title: 'Я УЧЕНИК',
                titleStyle: AppTextStyle.b7f46.copyWith(
                  fontSize: 300,
                  color: AppColors.pink.withOpacity(0.2),
                ),
                scrollPosition: scrollPosition,
                image: Pngs.student,
                imageOnLeft: true,
                children: [
                  const _TextSection(
                    color: AppColors.pink,
                    text:
                        'Быстрый поиск репетитора — пиши, что нужно, и получай отклики',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AppButton(
                          small: true,
                          bgColor: AppColors.mainColor,
                          border: false,
                          color: AppColors.mainColor,
                          text: 'Telegram группа',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: AppButton(
                          small: true,
                          bgColor: AppColors.mainColor,
                          color: AppColors.mainColor,
                          text: 'VK группа',
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: screenSize.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(100),
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
                title: 'Я УЧИТЕЛЬ',
                titleStyle: AppTextStyle.b7f46.copyWith(
                  fontSize: 300,
                  color: AppColors.mainColor.withOpacity(0.1),
                ),
                scrollPosition: scrollPosition,
                image: Pngs.teacher,
                imageOnLeft: false,
                children: [
                  const _TextSection(
                    color: AppColors.mainColor,
                    size: 30,
                    text:
                        'Удобное ведение занятий — расписание, оплата и ученики в одном месте',
                  ),
                  Row(
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
                  const _TextSection(
                    color: AppColors.mainColor,
                    size: 30,
                    text:
                        'Поток новых учеников — заявки из ВК и Telegram без посредников',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AppButton(
                          small: true,
                          bgColor: AppColors.pink,
                          border: false,
                          color: AppColors.pink,
                          text: 'Telegram группа',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: AppButton(
                          small: true,
                          bgColor: AppColors.pink,
                          color: AppColors.pink,
                          text: 'VK группа',
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            style: AppTextStyle.b7f46.copyWith(
              color: color.withOpacity(0.8),
              height: 1,
              fontSize: size,
            ),
          ),
        ),
      ],
    );
  }
}
