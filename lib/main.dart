import 'package:flutter/material.dart';

import 'routes.dart';
import 'screens/title/title_screen.dart';
import 'theme.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dove',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: TitleScreen.routeName,
      routes: routes,
    );
  }
}
