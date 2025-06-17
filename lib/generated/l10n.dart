// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `test`
  String get test {
    return Intl.message('test', name: 'test', desc: '', args: []);
  }

  /// `Full control over classes and student flow`
  String get appTitle {
    return Intl.message(
      'Full control over classes and student flow',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `© 2025 TeacherMate. All rights reserved.`
  String get bottomBarEmergensy {
    return Intl.message(
      '© 2025 TeacherMate. All rights reserved.',
      name: 'bottomBarEmergensy',
      desc: '',
      args: [],
    );
  }

  /// `Try Our Convenient Web Version`
  String get fourSectionTitle {
    return Intl.message(
      'Try Our Convenient Web Version',
      name: 'fourSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Join thousands of teachers already planning their schedules with TeacherMate.`
  String get fourSectionSubtitle {
    return Intl.message(
      'Join thousands of teachers already planning their schedules with TeacherMate.',
      name: 'fourSectionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Go to TeacherMate Web`
  String get fourSectionButton {
    return Intl.message(
      'Go to TeacherMate Web',
      name: 'fourSectionButton',
      desc: '',
      args: [],
    );
  }

  /// `Key Features`
  String get secondSectionTitle {
    return Intl.message(
      'Key Features',
      name: 'secondSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Smart Scheduling`
  String get secondSectionTitle1 {
    return Intl.message(
      'Smart Scheduling',
      name: 'secondSectionTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Student Management`
  String get secondSectionTitle2 {
    return Intl.message(
      'Student Management',
      name: 'secondSectionTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Find New Students`
  String get secondSectionTitle3 {
    return Intl.message(
      'Find New Students',
      name: 'secondSectionTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Free with No Subscriptions`
  String get secondSectionTitle4 {
    return Intl.message(
      'Free with No Subscriptions',
      name: 'secondSectionTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Reminders`
  String get secondSectionTitle5 {
    return Intl.message(
      'Automatic Reminders',
      name: 'secondSectionTitle5',
      desc: '',
      args: [],
    );
  }

  /// `Lesson Notes`
  String get secondSectionTitle6 {
    return Intl.message(
      'Lesson Notes',
      name: 'secondSectionTitle6',
      desc: '',
      args: [],
    );
  }

  /// `Simple and Intuitive`
  String get secondSectionTitle7 {
    return Intl.message(
      'Simple and Intuitive',
      name: 'secondSectionTitle7',
      desc: '',
      args: [],
    );
  }

  /// `Access from Any Device`
  String get secondSectionTitle8 {
    return Intl.message(
      'Access from Any Device',
      name: 'secondSectionTitle8',
      desc: '',
      args: [],
    );
  }

  /// `Plan your lessons with an intuitive calendar, color coding, and flexible settings.`
  String get secondSectionSubtitle1 {
    return Intl.message(
      'Plan your lessons with an intuitive calendar, color coding, and flexible settings.',
      name: 'secondSectionSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Keep all your students’ contacts, notes, and lesson history in one place.`
  String get secondSectionSubtitle2 {
    return Intl.message(
      'Keep all your students’ contacts, notes, and lesson history in one place.',
      name: 'secondSectionSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Connect with a tutor community and find new students — no fees involved.`
  String get secondSectionSubtitle3 {
    return Intl.message(
      'Connect with a tutor community and find new students — no fees involved.',
      name: 'secondSectionSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Full functionality with no hidden charges — teach with ease and confidence.`
  String get secondSectionSubtitle4 {
    return Intl.message(
      'Full functionality with no hidden charges — teach with ease and confidence.',
      name: 'secondSectionSubtitle4',
      desc: '',
      args: [],
    );
  }

  /// `Lesson reminders for you and your students — never miss a session.`
  String get secondSectionSubtitle5 {
    return Intl.message(
      'Lesson reminders for you and your students — never miss a session.',
      name: 'secondSectionSubtitle5',
      desc: '',
      args: [],
    );
  }

  /// `Track student progress and lesson plans right in the app.`
  String get secondSectionSubtitle6 {
    return Intl.message(
      'Track student progress and lesson plans right in the app.',
      name: 'secondSectionSubtitle6',
      desc: '',
      args: [],
    );
  }

  /// `A clean interface with only what you need to teach — no distractions.`
  String get secondSectionSubtitle7 {
    return Intl.message(
      'A clean interface with only what you need to teach — no distractions.',
      name: 'secondSectionSubtitle7',
      desc: '',
      args: [],
    );
  }

  /// `Use it on phone or desktop — your data stays in sync across all devices.`
  String get secondSectionSubtitle8 {
    return Intl.message(
      'Use it on phone or desktop — your data stays in sync across all devices.',
      name: 'secondSectionSubtitle8',
      desc: '',
      args: [],
    );
  }

  /// `I AM A STUDENT`
  String get threeSectionStudent {
    return Intl.message(
      'I AM A STUDENT',
      name: 'threeSectionStudent',
      desc: '',
      args: [],
    );
  }

  /// `Find a tutor fast — tell us what you need and get replies directly.`
  String get threeSectionStudentMessage {
    return Intl.message(
      'Find a tutor fast — tell us what you need and get replies directly.',
      name: 'threeSectionStudentMessage',
      desc: '',
      args: [],
    );
  }

  /// `Telegram Group`
  String get tgButton {
    return Intl.message('Telegram Group', name: 'tgButton', desc: '', args: []);
  }

  /// `VK Group`
  String get vkButton {
    return Intl.message('VK Group', name: 'vkButton', desc: '', args: []);
  }

  /// `I AM A TEACHER`
  String get threeSectionTeacher {
    return Intl.message(
      'I AM A TEACHER',
      name: 'threeSectionTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Manage lessons with ease — schedule, payments, and students all in one place.`
  String get threeSectionTeacherMessage {
    return Intl.message(
      'Manage lessons with ease — schedule, payments, and students all in one place.',
      name: 'threeSectionTeacherMessage',
      desc: '',
      args: [],
    );
  }

  /// `Steady stream of new students — direct requests from VK and Telegram.`
  String get threeSectionTeacherMessageTwo {
    return Intl.message(
      'Steady stream of new students — direct requests from VK and Telegram.',
      name: 'threeSectionTeacherMessageTwo',
      desc: '',
      args: [],
    );
  }

  /// `Find Students/Tutors:`
  String get buttonGroupTitle {
    return Intl.message(
      'Find Students/Tutors:',
      name: 'buttonGroupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lesson Management App:`
  String get buttonAppsTitle {
    return Intl.message(
      'Lesson Management App:',
      name: 'buttonAppsTitle',
      desc: '',
      args: [],
    );
  }

  /// `No subscriptions, no fees — just you and your knowledge.`
  String get firstSectionMessage1 {
    return Intl.message(
      'No subscriptions, no fees — just you and your knowledge.',
      name: 'firstSectionMessage1',
      desc: '',
      args: [],
    );
  }

  /// `Available on all platforms: Web • Android • iPhone`
  String get firstSectionMessage2 {
    return Intl.message(
      'Available on all platforms: Web • Android • iPhone',
      name: 'firstSectionMessage2',
      desc: '',
      args: [],
    );
  }

  /// `Open Telegram group for finding students and tutors.`
  String get firstSectionMessage3 {
    return Intl.message(
      'Open Telegram group for finding students and tutors.',
      name: 'firstSectionMessage3',
      desc: '',
      args: [],
    );
  }

  /// `Lessons, scheduling, notes — all in one place.`
  String get firstSectionMessage4 {
    return Intl.message(
      'Lessons, scheduling, notes — all in one place.',
      name: 'firstSectionMessage4',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
