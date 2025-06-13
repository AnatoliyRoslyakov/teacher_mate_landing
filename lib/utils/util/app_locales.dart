import 'dart:io';

class AppLocales {
  const AppLocales();

  static const String localeEN = 'en';
  static const String localeRU = 'ru';

  String getDefaultLocale() {
    final String defaultSystemLocale = Platform.localeName;
    if (defaultSystemLocale.startsWith(AppLocales.localeRU)) {
      return AppLocales.localeRU;
    }
    return AppLocales.localeEN;
  }
}
