import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher_mate_landing/resource/svgs.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.opacity,
    required this.blurIntensity,
  });

  final double opacity;
  final double blurIntensity;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(opacity),
      elevation: 3,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurIntensity,
            sigmaY: blurIntensity,
          ),
          child: Container(color: Colors.white.withOpacity(opacity * 0.9)),
        ),
      ),

      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: opacity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SvgPicture.asset(Svgs.logo, height: 40, width: 40),
            ),
            const SizedBox(width: 5),
            RichText(
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: 'Teacher',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Mate', style: AppTextStyle.b7f32pink),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton(onPressed: () {}, child: const Text('Features')),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton(onPressed: () {}, child: const Text('Pricing')),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton(onPressed: () {}, child: const Text('About')),
        ),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: AppButton(
              text: 'Text Button',
              onPressed: () {},
              invers: true,
              small: true,
              expand: false,
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
