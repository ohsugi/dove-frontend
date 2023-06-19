import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Preferences {
  static bool splash = true;

  static final Preferences _instance = Preferences._internal();
  factory Preferences() {
    return _instance;
  }
  Preferences._internal();

  static String dataString = 'preferences';
  static Map<String, dynamic> toJson() => {
        'splash': splash,
      };
  static void fromJson(Map<String, dynamic> json) => {
        Preferences.splash = json['splash'],
      };

  static save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(dataString, json.encode(toJson()));
  }

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString(dataString) ?? '{}';
    if (jsonString == '{}') {
      return;
    }
    fromJson(json.decode(jsonString));
  }

  static remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(dataString);
  }
}
