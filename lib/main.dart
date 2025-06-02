import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher_mate_landing/resource/jpgs.dart';
import 'package:teacher_mate_landing/resource/svgs.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/app_button.dart';

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
      precacheImage(const AssetImage(Jpgs.macbookMockup1), context);
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
        child: SizedBox(
          width: screenSize.width,
          child: Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  top: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PhoneMockupWidget(scrollPosition: scrollPosition),

                        TitleInfoWidget(
                          scrollPosition: scrollPosition,
                          opacity: opacity,
                        ),
                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Features Section
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 80,
                        horizontal: isSmallScreen ? 20 : 100,
                      ),
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Text(
                            'Key Features',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Wrap(
                            spacing: 40,
                            runSpacing: 40,
                            alignment: WrapAlignment.center,
                            children: [
                              _FeatureCard(
                                icon: Icons.calendar_today,
                                title: 'Intuitive Scheduling',
                                description:
                                    'Easily manage your lessons with a clean, visual calendar interface.',
                                scrollPosition: scrollPosition,
                                index: 0,
                              ),
                              _FeatureCard(
                                icon: Icons.notifications,
                                title: 'Automated Reminders',
                                description:
                                    'Never miss a lesson with automatic reminders for you and your students.',
                                scrollPosition: scrollPosition,
                                index: 1,
                              ),
                              _FeatureCard(
                                icon: Icons.payment,
                                title: 'Payment Tracking',
                                description:
                                    'Keep track of payments and invoices in one place.',
                                scrollPosition: scrollPosition,
                                index: 2,
                              ),
                              _FeatureCard(
                                icon: Icons.analytics,
                                title: 'Progress Reports',
                                description:
                                    'Generate reports to track student progress over time.',
                                scrollPosition: scrollPosition,
                                index: 3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Device Showcase Section
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 80),
                      color: Colors.blue.shade50,
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            transform: Matrix4.translationValues(
                              0,
                              -scrollPosition * 0.1,
                              0,
                            ),
                            child: Image.asset(
                              Jpgs.macbookMockup1,
                              height: isSmallScreen ? 300 : 500,
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Seamless Experience Across All Devices',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Access your schedule and student information from your phone, tablet, or computer.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
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
                                icon: const Icon(
                                  Icons.inbox,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned.fill(
                  top: screenSize.height * 0.8,
                  right: 30,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10,
                      children: [
                        AppButton(text: 'Text Button', onPressed: () {}),
                        AppButton(text: 'Text Button', onPressed: () {}),
                        AppButton(text: 'Text Button', onPressed: () {}),
                        AppButton(text: 'Text Button', onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
              'Полный контроль над уроками\nи потоком учеников',
              textAlign: TextAlign.center,

              style: AppTextStyle.b7f46,
            ),
          ),
          const SizedBox(height: 60),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                children: [
                  Icon(Icons.check, color: AppColors.pink),
                  SizedBox(width: 5),
                  Text(
                    'Никаких подписок, никаких комиссий — только ты и знания',

                    style: AppTextStyle.b5f18,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check, color: AppColors.pink),
                  SizedBox(width: 5),
                  Text(
                    'Приложение на всех платформах Web • Android • iPhone',

                    style: AppTextStyle.b5f18,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check, color: AppColors.pink),
                  SizedBox(width: 5),
                  Text(
                    'Открытая Telegram-группа для поиска учеников и репетиторов',

                    style: AppTextStyle.b5f18,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check, color: AppColors.pink),
                  SizedBox(width: 5),
                  Text(
                    'Занятия, расписание, заметки — всё в одном месте',

                    style: AppTextStyle.b5f18,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PhoneMockupWidget extends StatelessWidget {
  const PhoneMockupWidget({super.key, required this.scrollPosition});

  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600, //1000
      child: Stack(
        children: [
          Positioned(
            top: 50,
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedContainer(
                width: 350,
                duration: const Duration(milliseconds: 500),
                transform: Matrix4.translationValues(
                  0,
                  -scrollPosition * 0.1,
                  0,
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.black, Colors.transparent],
                      stops: [0.0, 0.5, 0.7],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(Jpgs.phoneMocup2, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
            left: 200,
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedContainer(
                width: 400,
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(
                  0,
                  -scrollPosition * 0.3,
                  0,
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.black, Colors.transparent],
                      stops: [0.0, 0.5, 0.7],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(Jpgs.phoneMocup1, fit: BoxFit.cover),
                ),
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.centerRight,
          //   child: AnimatedContainer(
          //     width: 500,
          //     duration: const Duration(milliseconds: 500),
          //     transform: Matrix4.translationValues(
          //       0,
          //       -scrollPosition * 0.2,
          //       0,
          //     ),
          //     child: Image.asset(
          //       Jpgs.phoneMocup1,
          //       // height: isSmallScreen ? 300 : 400,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

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
          child: AppButton(
            text: 'Text Button',
            onPressed: () {},
            isMainAction: false,
            small: true,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final double scrollPosition;
  final int index;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.scrollPosition,
    required this.index,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didUpdateWidget(covariant _FeatureCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Trigger animation when the card comes into view
    if (widget.scrollPosition > 300 + widget.index * 100 - 200) {
      _controller.forward();
    } else {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 50 * (1 - _animation.value)),
            child: Opacity(opacity: _animation.value, child: child),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow:
                _isHovering
                    ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: const Offset(0, 10),
                      ),
                    ]
                    : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
            border: Border.all(
              color:
                  _isHovering
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                      : Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                widget.icon,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
