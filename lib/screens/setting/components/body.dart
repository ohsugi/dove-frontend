import 'package:flutter/material.dart';

import '../../../enums.dart';
import '../../../preferences.dart';
import '../../../theme_manager.dart';
import 'custom_list_tile.dart';
import 'simple_drop_down.dart';
import 'single_section.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  static const componentWidthPercentage = 0.5;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() => super.initState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SingleSection(
            title: 'General',
            children: [
              CustomListTile(
                title: 'Dark Mode',
                icon: Icons.dark_mode_outlined,
                trailing: Switch(
                  value: Preferences.darkMode,
                  onChanged: (value) {
                    setState(() {
                      ThemeManager().darkMode = value;
                    });
                  },
                ),
              ),
              CustomListTile(
                title: 'Notifications',
                icon: Icons.notifications_none_rounded,
                trailing: Switch(
                  value: Preferences.notifications,
                  onChanged: (value) {
                    setState(() {
                      Preferences.notifications = value;
                    });
                  },
                ),
              ),
              CustomListTile(
                title: 'Language',
                icon: Icons.language_rounded,
                trailing: SizedBox(
                  height: 40,
                  width: screenSize.width * Body.componentWidthPercentage,
                  child: SimpleDropDown(
                    initialSelectedIndex: myLanguageMap.keys
                        .toList()
                        .indexOf(Preferences.language),
                    itemList:
                        myLanguageMap.values.toList().map((e) => e).toList(),
                    onSelectedIndex: (index) {
                      setState(() {
                        Preferences.language = myLanguageMap.keys
                            .toList()
                            .map((e) => e)
                            .toList()[index];
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          SingleSection(
            title: 'Information',
            children: [
              const CustomListTile(
                title: 'Help & Feedback',
                icon: Icons.help_outline_rounded,
              ),
              CustomListTile(
                title: 'Version',
                icon: Icons.info_outline_rounded,
                trailing: Text(
                  Preferences.versionString,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const CustomListTile(
                title: 'Sign out',
                icon: Icons.exit_to_app_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
