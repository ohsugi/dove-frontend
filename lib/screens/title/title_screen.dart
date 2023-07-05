import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class TitleScreen extends StatelessWidget {
  static const routeName = "/title";
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
