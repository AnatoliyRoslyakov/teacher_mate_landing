import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher_mate_landing/resource/jpgs.dart';
import 'package:teacher_mate_landing/resource/svgs.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_bar.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';
import 'package:teacher_mate_landing/widget/buttons_group.dart';
import 'package:teacher_mate_landing/widget/feature_card.dart';
import 'package:teacher_mate_landing/widget/phone_mockup.dart';
import 'package:teacher_mate_landing/widget/title_info.dart';

void main() => runApp(const TeacherMateApp());

class TeacherMateApp extends StatelessWidget {
  const TeacherMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TeacherMateLanding(),
    );
  }
}

class TeacherMateLanding extends StatefulWidget {
  const TeacherMateLanding({super.key});

  @override
  State<TeacherMateLanding> createState() => _TeacherMateLandingState();
}

class _TeacherMateLandingState extends State<TeacherMateLanding> {
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0;
  double opacity = 1;
  double blurIntensity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        setState(() {
          scrollPosition = _scrollController.position.pixels;
          opacity = (1 - scrollPosition / 300).clamp(0.0, 1.0);
          blurIntensity = (scrollPosition / 1000).clamp(0.0, 10.0);
        });
      });

      // Pre-cache images for smooth animations
      precacheImage(AssetImage(Jpgs.phoneMocup1), context);
      precacheImage(AssetImage(Jpgs.phoneMocup2), context);
      precacheImage(AssetImage(Jpgs.macbookMockup1), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(opacity: opacity, blurIntensity: blurIntensity),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            PhoneMockupWidget(scrollPosition: scrollPosition),
            Column(
              children: [
                FirstSection(
                  screenSize: screenSize,
                  opacity: opacity,
                  scrollPosition: scrollPosition,
                ),
                SecondSection(
                  isSmallScreen: isSmallScreen,
                  scrollPosition: scrollPosition,
                ),

                // Device Showcase Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: screenSize.height * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
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
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,

                                    child: Text(
                                      'Я УЧЕНИК',
                                      style: AppTextStyle.b7f46.copyWith(
                                        fontSize: 300,
                                        color: AppColors.pink.withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  transform: Matrix4.translationValues(
                                    0,
                                    (-scrollPosition + 2000) * 0.2,
                                    0,
                                  ),
                                  child: Image.asset(
                                    Jpgs.phoneMocup2,
                                    height: isSmallScreen ? 300 : 500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: screenSize.height * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
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
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'Я УЧИТЕЛЬ',
                                      style: AppTextStyle.b7f46.copyWith(
                                        fontSize: 300,
                                        color: AppColors.mainColor.withOpacity(
                                          0.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  transform: Matrix4.translationValues(
                                    0,
                                    (-scrollPosition + 2000) * 0.2,
                                    0,
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        Jpgs.phoneMocup2,
                                        height: isSmallScreen ? 300 : 500,
                                      ),
                                      Image.asset(
                                        Jpgs.phoneMocup1,
                                        height: isSmallScreen ? 300 : 500,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // CTA Section
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: isSmallScreen ? 20 : 100,
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Text(
                        'Ready to Transform Your Teaching?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Join thousands of tutors who are already organizing their schedules with TeacherMate.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      const SizedBox(height: 40),
                      AppButton(text: 'Text Button', onPressed: () {}),
                    ],
                  ),
                ),
                // Footer
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Svgs.logoNoBackground,
                            color: Colors.white,
                            height: 35,
                            width: 35,
                          ),
                          SizedBox(width: 5),
                          const Text(
                            'TeacherMate',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '© 2023 TeacherMate. All rights reserved.',
                        style: TextStyle(color: Colors.white54),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.telegram,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.inbox, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
    required this.isSmallScreen,
    required this.scrollPosition,
  });

  final bool isSmallScreen;
  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isSmallScreen ? 20 : 100,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Основные возможности',
            style: AppTextStyle.b7f46.copyWith(fontSize: 36),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              FeatureCard(
                icon: Icons.calendar_month,
                title: 'Удобное расписание',
                description:
                    'Планируйте уроки в интуитивном календаре с цветовой маркировкой и гибкими настройками.',
                scrollPosition: scrollPosition,
                index: 0,
              ),
              FeatureCard(
                icon: Icons.group,
                title: 'Управление учениками',
                description:
                    'Ведите базу учеников с контактами, заметками и историей занятий в одном месте.',
                scrollPosition: scrollPosition,
                index: 1,
              ),
              FeatureCard(
                icon: Icons.search,
                title: 'Поиск новых учеников',
                description:
                    'Подключайтесь к сообществу репетиторов и находите новых учеников без комиссий.',
                scrollPosition: scrollPosition,
                index: 2,
              ),
              FeatureCard(
                icon: Icons.money_off,
                title: 'Бесплатно и без подписок',
                description:
                    'Полный функционал без скрытых платежей — работайте комфортно и без лишних затрат.',
                scrollPosition: scrollPosition,
                index: 3,
              ),
              FeatureCard(
                icon: Icons.notifications_active,
                title: 'Автоматические напоминания',
                description:
                    'Уведомления для вас и учеников о предстоящих уроках — никаких пропущенных занятий!',
                scrollPosition: scrollPosition,
                index: 4,
              ),
              FeatureCard(
                icon: Icons.note_alt,
                title: 'Заметки к урокам',
                description:
                    'Записывайте прогресс учеников и планы следующих занятий прямо в приложении.',
                scrollPosition: scrollPosition,
                index: 5,
              ),
              FeatureCard(
                icon: Icons.design_services,
                title: 'Простота и удобство',
                description:
                    'Минималистичный дизайн без лишних кнопок — только то, что нужно для работы.',
                scrollPosition: scrollPosition,
                index: 6,
              ),
              FeatureCard(
                icon: Icons.phone_android,
                title: 'Доступ с любого устройства',
                description:
                    'Работайте с телефона или компьютера — ваши данные всегда синхронизированы.',
                scrollPosition: scrollPosition,
                index: 7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
    required this.screenSize,
    required this.opacity,
    required this.scrollPosition,
  });

  final Size screenSize;
  final double opacity;
  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.9,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,

                      Color.fromARGB(63, 255, 0, 238),
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: screenSize.width / 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TitleInfoWidget(
                              scrollPosition: scrollPosition,
                              opacity: opacity,
                            ),
                            SizedBox(height: 60),
                            ButtonsGroupWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
