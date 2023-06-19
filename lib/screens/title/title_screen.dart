import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class TitleScreen extends StatelessWidget {
  static String routeName = "/title";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
