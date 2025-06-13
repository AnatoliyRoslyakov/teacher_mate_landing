import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> appLaunchUrl(String url) async {
  final link = Uri.parse(url);
  final canLaunch = await canLaunchUrl(link);
  if (canLaunch) {
    if (kDebugMode) log('canLaunchUrl? -- $canLaunch');
    await launchUrl(link, mode: LaunchMode.externalNonBrowserApplication);
  } else {
    if (kDebugMode) log('Could not launch $url with app');
    await launchUrl(link, mode: LaunchMode.externalApplication);
  }
}
