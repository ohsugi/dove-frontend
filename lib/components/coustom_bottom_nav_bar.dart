import 'package:dove_frontend/theme_manager.dart';
import 'package:flutter/material.dart';

import '../enums.dart';
import '../preferences.dart';
import '../screens/home/home_screen.dart';
import '../screens/setting/setting_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: ThemeManager.currentThemeData.cardColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: ThemeManager.currentThemeData.cardColor.withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.public,
                  color: selectedMenu == MenuState.home
                      ? ThemeManager.currentThemeData.primaryColor
                      : ThemeManager.currentThemeData.highlightColor,
                ),
                onPressed: () => selectedMenu == MenuState.home
                    ? null
                    : {
                        Preferences.save(),
                        Navigator.pushNamed(context, HomeScreen.routeName),
                      },
              ),
              IconButton(
                icon: Icon(
                  Icons.library_books,
                  color: selectedMenu == MenuState.inventry
                      ? ThemeManager.currentThemeData.primaryColor
                      : ThemeManager.currentThemeData.highlightColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.shield,
                  color: selectedMenu == MenuState.campaign
                      ? ThemeManager.currentThemeData.primaryColor
                      : ThemeManager.currentThemeData.highlightColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: selectedMenu == MenuState.setting
                      ? ThemeManager.currentThemeData.primaryColor
                      : ThemeManager.currentThemeData.highlightColor,
                ),
                onPressed: () => selectedMenu == MenuState.setting
                    ? null
                    : {
                        Preferences.save(),
                        Navigator.pushNamed(context, SettingScreen.routeName),
                      },
              ),
            ],
          )),
    );
  }
}
