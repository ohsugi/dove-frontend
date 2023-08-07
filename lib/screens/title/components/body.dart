import 'dart:async';

import 'package:dove_frontend/preferences.dart';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';
import '../../splash/splash_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Preferences.init();
    });
    timer ??= Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(
        context,
        Preferences.splash ? SplashScreen.routeName : HomeScreen.routeName,
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      );
}
