import 'dart:async';

import 'package:dove_frontend/preferences.dart';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';
import '../../splash/splash_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Preferences.init();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushNamed(
            context,
            Preferences.splash
                ? SplashScreen.routeName
                : HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          child: Text('Dove',
              style: TextStyle(color: Colors.white, fontSize: 50))),
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/title.jpg'), fit: BoxFit.cover)),
    ));
  }
}
