import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';

class ButtonsGroupWidget extends StatelessWidget {
  final bool small;
  const ButtonsGroupWidget({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          Text(
            S.of(context).buttonGroupTitle,
            style: AppTextStyle.b3f16.copyWith(color: AppColors.mainColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppButton(
                  bgColor: AppColors.mainColor,
                  border: false,
                  color: AppColors.mainColor,
                  text: S.of(context).tgButton,
                  onPressed: () {},

                  // border: false,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: AppButton(
                  bgColor: AppColors.mainColor,
                  color: AppColors.mainColor,
                  text: S.of(context).vkButton,
                  onPressed: () {},
                  border: false,
                  // border: false,
                ),
              ),
            ],
          ),
          Text(
            S.of(context).buttonAppsTitle,
            style: AppTextStyle.b3f16.copyWith(color: AppColors.mainColor),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppButton(
                  bgColor: AppColors.mainColor,
                  color: AppColors.mainColor,
                  text: 'Android',
                  onPressed: () {},
                  icon: Icon(Icons.android, color: AppColors.mainColor),
                  border: false,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: AppButton(
                  color: AppColors.mainColor,
                  bgColor: AppColors.mainColor,
                  text: 'Apple',
                  onPressed: () {},
                  icon: Icon(Icons.apple, color: AppColors.mainColor),

                  border: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
