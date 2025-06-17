import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
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
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
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
              textAlign: isSmall ? TextAlign.center : TextAlign.left,
              style: AppTextStyle.b7f46.copyWith(
                color: AppColors.mainColor,
                fontSize: isSmall ? 40 : 65,
              ),
            ),
          ),
          const SizedBox(height: 60),

          Padding(
            padding: isSmall ? EdgeInsets.zero : EdgeInsets.only(left: 80),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                _TextSection(text: S.of(context).firstSectionMessage1),
                _TextSection(text: S.of(context).firstSectionMessage2),
                _TextSection(text: S.of(context).firstSectionMessage3),
                _TextSection(text: S.of(context).firstSectionMessage4),
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
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check, color: AppColors.pink),
        SizedBox(width: 5),
        Flexible(
          child: Text(
            text,
            style: isSmall ? AppTextStyle.b4f16 : AppTextStyle.b5f18,
          ),
        ),
      ],
    );
  }
}
