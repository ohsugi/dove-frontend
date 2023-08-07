import 'package:flutter/widgets.dart';

import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/setting/setting_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/title/title_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  TitleScreen.routeName: (context) => const TitleScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
};
