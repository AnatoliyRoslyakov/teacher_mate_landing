import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';

class FourSection extends StatelessWidget {
  const FourSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Воспользуйтесь нашей удобной веб-версией',
            textAlign: TextAlign.center,
            style: AppTextStyle.b7f46,
          ),
          const SizedBox(height: 20),
          Text(
            'Присоединяйтесь к тысячам преподавателей, которые уже планируют своё расписание с TeacherMate',
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
              text: 'Перейти на страницу TeacherMate',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
