import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/sharedpref.dart';
import '../utils/sharedPrefKeys.dart';
import 'app_localization.dart';

const Iterable<LocalizationsDelegate<dynamic>> localizationDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const supportLanguageCode = ['en', 'ar'];
int selectedLang = 0;
Map supportedLocaleMap = {
  const Locale.fromSubtags(
    languageCode: 'en',
    countryCode: 'US',
  ): 'assets/locale/lang_en.json',
  const Locale.fromSubtags(
    languageCode: 'ar',
  ): 'assets/locale/lang_ar.json',
};

List<Locale> supportedLocale = [
  const Locale.fromSubtags(
    languageCode: 'en',
    countryCode: 'US',
  ),
  const Locale.fromSubtags(
    languageCode: 'ar',
  ),
];

Future<void> getLang() async {
  try {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    selectedLang = myPrefs.getInt(
          SharedPrefKeys.selectedLanguage,
        ) ??
        0;
  } catch (e) {
    MySharedPreferences.instance.setIntValue(
      SharedPrefKeys.selectedLanguage,
      0,
    );
  }
}

Locale? getSelectedLang(Locale? locale, Iterable<Locale> supportedLocales) {
  try {
    selectedLang = MySharedPreferences.instance.getIntValue(
      SharedPrefKeys.selectedLanguage,
    );
    return supportedLocale[selectedLang];
  } catch (e) {
    MySharedPreferences.instance
        .setIntValue(SharedPrefKeys.selectedLanguage, 0);
    return supportedLocale[0];
  }
}
