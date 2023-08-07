import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_manager.dart';

class Preferences {
  factory Preferences() => _instance;
  Preferences._internal();
  static bool splash = true;
  static bool darkMode = false;
  static bool notifications = true;
  static Locale language = const Locale('en', 'US');
  static late String versionString;
  static const String dataString = 'preferences';

  static final Preferences _instance = Preferences._internal();

  static Map<String, dynamic> toJson() => {
        'splash': Preferences.splash,
        'darkMode': Preferences.darkMode,
        'notifications': Preferences.notifications,
        'language': Preferences.language.toString(),
      };

  static void fromJson(Map<String, dynamic> json) {
    Preferences.splash = json['splash'];
    Preferences.darkMode = json['darkMode'];
    ThemeManager().darkMode = Preferences.darkMode;
    Preferences.notifications = json['notifications'];
    Preferences.language = Locale(
      json['language'].split('_')[0],
      json['language'].split('_')[1],
    );
  }

  static Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Preferences.dataString, json.encode(toJson()));
  }

  static Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    versionString =
        '${packageInfo.appName} ${packageInfo.version} (build ${packageInfo.buildNumber})';

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(Preferences.dataString) ?? '{}';
    if (jsonString == '{}') {
      return;
    }
    fromJson(json.decode(jsonString));
  }

  static Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Preferences.dataString);
  }
}
