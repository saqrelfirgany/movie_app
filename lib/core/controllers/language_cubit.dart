import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Language { en, ar }

class LanguageCubit extends Cubit<Language> {
  LanguageCubit() : super(Language.en) {
    loadLanguage();
  }

  Future<void> changeLanguage(Language language) async {
    emit(language);
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('language', language.index);
  }

  Future<void> loadLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    final savedLanguage = preferences.getInt('language');
    if (savedLanguage != null) {
      emit(Language.values[savedLanguage]);
    }
  }

  Locale get currentLocale {
    return state == Language.en ? const Locale('en') : const Locale('ar');
  }

  String get currentLanguageCode {
    return state == Language.en ? 'en' : 'ar';
  }

  String translate(String key) {
    // Implement localization based on your preferred method (e.g., using the intl package).
    return Intl.message(key, locale: currentLanguageCode);
  }
}
