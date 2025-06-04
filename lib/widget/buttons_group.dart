import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';

class ButtonsGroupWidget extends StatelessWidget {
  const ButtonsGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: AppButton(
              color: Colors.black,
              invers: true,
              text: 'Поиск Учеников/Репетиторов',
              onPressed: () {},
              icon: Icon(Icons.telegram, color: Colors.lightBlue),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppButton(
                  color: Colors.black,
                  invers: true,
                  text: 'Android',
                  onPressed: () {},
                  icon: Icon(Icons.android, color: Colors.lightGreenAccent),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: AppButton(
                  color: Colors.black,
                  invers: true,
                  text: 'Apple',
                  onPressed: () {},
                  icon: Icon(Icons.apple, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
