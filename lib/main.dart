import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const TeacherMateApp());

class TeacherMateApp extends StatelessWidget {
  const TeacherMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeacherMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade800,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
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
  double _scrollPosition = 0;
  double _opacity = 1;
  double _blurIntensity = 0;
  bool _isHoveringDownload = false;
  bool _isHoveringFeatures = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        setState(() {
          _scrollPosition = _scrollController.position.pixels;
          _opacity = (1 - _scrollPosition / 300).clamp(0.0, 1.0);
          _blurIntensity = (_scrollPosition / 1000).clamp(0.0, 10.0);
        });
      });

      // Pre-cache images for smooth animations
      precacheImage(const AssetImage('assets/phone_mockup.png'), context);
      precacheImage(const AssetImage('assets/macbook_mockup.png'), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 800;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(_opacity),
        elevation: 3,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: _blurIntensity,
              sigmaY: _blurIntensity,
            ),
            child: Container(color: Colors.white.withOpacity(_opacity * 0.9)),
          ),
        ),

        title: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _opacity,
            child: const Text(
              'TeacherMate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
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
          MouseRegion(
            onEnter: (_) => setState(() => _isHoveringDownload = true),
            onExit: (_) => setState(() => _isHoveringDownload = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color:
                    _isHoveringDownload
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Text(
                'Download',
                style: TextStyle(
                  color:
                      _isHoveringDownload
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section
            SizedBox(
              height: screenSize.height * 0.9,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.blue.shade50],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 20 : 100,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: _opacity,
                            duration: const Duration(milliseconds: 300),
                            child: const Text(
                              'Organize Your Teaching Schedule\nWith Ease',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          AnimatedOpacity(
                            opacity: _opacity,
                            duration: const Duration(milliseconds: 300),
                            child: const Text(
                              'The perfect calendar solution for tutors and private teachers',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          MouseRegion(
                            onEnter:
                                (_) =>
                                    setState(() => _isHoveringFeatures = true),
                            onExit:
                                (_) =>
                                    setState(() => _isHoveringFeatures = false),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _isHoveringFeatures
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                'Explore Features',
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      _isHoveringFeatures
                                          ? Colors.white
                                          : Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            transform: Matrix4.translationValues(
                              0,
                              -_scrollPosition * 0.2,
                              0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/phone_mockup.png',
                                  height: isSmallScreen ? 300 : 400,
                                ),
                                Image.asset(
                                  'assets/phone_mockup.png',
                                  height: isSmallScreen ? 300 : 400,
                                ),
                              ],
                            ),
                          ),
                        ],
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
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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
                        scrollPosition: _scrollPosition,
                        index: 0,
                      ),
                      _FeatureCard(
                        icon: Icons.notifications,
                        title: 'Automated Reminders',
                        description:
                            'Never miss a lesson with automatic reminders for you and your students.',
                        scrollPosition: _scrollPosition,
                        index: 1,
                      ),
                      _FeatureCard(
                        icon: Icons.payment,
                        title: 'Payment Tracking',
                        description:
                            'Keep track of payments and invoices in one place.',
                        scrollPosition: _scrollPosition,
                        index: 2,
                      ),
                      _FeatureCard(
                        icon: Icons.analytics,
                        title: 'Progress Reports',
                        description:
                            'Generate reports to track student progress over time.',
                        scrollPosition: _scrollPosition,
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
                      -_scrollPosition * 0.1,
                      0,
                    ),
                    child: Image.asset(
                      'assets/macbook_mockup.png',
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
                      style: TextStyle(fontSize: 20, color: Colors.grey),
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
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Join thousands of tutors who are already organizing their schedules with TeacherMate.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHoveringDownload = true),
                    onExit: (_) => setState(() => _isHoveringDownload = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color:
                            _isHoveringDownload
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'Download Now',
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              _isHoveringDownload
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              color: Colors.black,
              child: Column(
                children: [
                  const Text(
                    'TeacherMate',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.telegram, color: Colors.white),
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
      ),
    );
  }
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
