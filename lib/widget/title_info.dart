import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';

class TitleInfoWidget extends StatelessWidget {
  const TitleInfoWidget({
    super.key,
    required this.scrollPosition,
    required this.opacity,
  });

  final double scrollPosition;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      transform: Matrix4.translationValues(0, -scrollPosition * 0.5, 0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 300),
            child: Text(
              S.of(context).appTitle,
              textAlign: TextAlign.left,

              style: AppTextStyle.b7f46.copyWith(
                color: AppColors.mainColor,
                fontSize: 65,
              ),
            ),
          ),
          const SizedBox(height: 60),

          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                _TextSection(
                  text:
                      'Никаких подписок, никаких комиссий — только ты и знания',
                ),
                _TextSection(
                  text: 'Приложение на всех платформах Web • Android • iPhone',
                ),
                _TextSection(
                  text:
                      'Открытая Telegram-группа для поиска учеников и репетиторов',
                ),
                _TextSection(
                  text: 'Занятия, расписание, заметки — всё в одном месте',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  final String text;
  const _TextSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check, color: AppColors.pink),
        SizedBox(width: 5),
        Text(text, style: AppTextStyle.b5f18),
      ],
    );
  }
}
