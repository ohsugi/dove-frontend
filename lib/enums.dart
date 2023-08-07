import 'package:flutter/material.dart';

enum MenuState {
  home,
  inventry,
  campaign,
  setting,
}

final Map<Locale, String> myLanguageMap = {
  const Locale('en', 'US'): 'English',
  const Locale('es', 'ES'): 'Español',
  const Locale('zh', 'CN'): '中文 (繁體)',
  const Locale('zh', 'TW'): '中文 (简体)',
  const Locale('ja', 'JP'): '日本語',
  const Locale('de', 'DE'): 'Deutsch',
  const Locale('fr', 'FR'): 'Français',
};
