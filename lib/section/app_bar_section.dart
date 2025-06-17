import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher_mate_landing/bloc/landing_bloc.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/resource/svgs.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSection({
    super.key,
    required this.opacity,
    required this.blurIntensity,
  });

  final double opacity;
  final double blurIntensity;

  @override
  PreferredSizeWidget build(BuildContext context) {
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
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
            if (!isSmall)
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
          child: LanguageSwitcher(
            opacity: opacity,
            isEnglish: context.watch<LandingBloc>().state.locale == 'en',
            onToggle:
                () => context.read<LandingBloc>().add(LandingEvent.locale()),
          ),
        ),

        AppButton(
          small: true,
          expand: false,
          border: true,
          color: AppColors.mainColor,

          // bgColor: AppColors.mainColor,
          icon: Icon(Icons.navigate_next, color: AppColors.pink),
          text: isSmall ? 'Регистрация' : S.of(context).fourSectionButton,
          onPressed: () {},
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LanguageSwitcher extends StatelessWidget {
  final bool isEnglish;
  final VoidCallback onToggle;
  final double opacity;

  const LanguageSwitcher({
    super.key,
    required this.isEnglish,
    required this.onToggle,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          border: Border.all(
            color: isEnglish ? AppColors.pink : AppColors.mainColor,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // Текстовые лейблы
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isEnglish ? 8 : 40,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  isEnglish ? '  EN' : 'RU',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Переключатель
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment:
                  isEnglish ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(4),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isEnglish
                          ? AppColors.pink.withOpacity(0.2)
                          : AppColors.mainColor.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.translate,
                  color: isEnglish ? AppColors.pink : AppColors.mainColor,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
