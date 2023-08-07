import 'package:flutter/material.dart';
import 'package:solana_wallet_provider/solana_wallet_provider.dart';

import '../../size_config.dart';
import 'components/body.dart';

class TitleScreen extends StatelessWidget {
  static const routeName = "/title";
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: FutureBuilder(
        future: SolanaWalletProvider.initialize(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }
          return const Body();
        }),
      ),
    );
  }
}
