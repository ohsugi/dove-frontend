import 'package:flutter/material.dart';

import '../../cart/cart_screen.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            icon: Icon(Icons.account_balance_wallet),
            numOfitem: 0,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
        ],
      ),
    );
  }
}
