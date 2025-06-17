import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';

class FourSection extends StatelessWidget {
  const FourSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmall ? 20 : 100,
        horizontal: isSmall ? 16 : 100,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            S.of(context).fourSectionTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.b7f46,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).fourSectionSubtitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.b5f18.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 40),
          SizedBox(
            child: AppButton(
              expand: false,
              border: false,
              color: Colors.black,
              bgColor: AppColors.pink,
              icon: Icon(Icons.navigate_next),
              text: S.of(context).fourSectionButton,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
