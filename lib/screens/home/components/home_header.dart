import 'package:flutter/material.dart';
import 'package:solana_wallet_provider/solana_wallet_provider.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  Future<void> _connect(
    final BuildContext context,
    final SolanaWalletProvider provider,
  ) async {
    if (!provider.adapter.isAuthorized) {
      await provider.connect(context);
      setState(() {});
    }
  }

  /// Disconnects the application from a wallet running on the device.
  Future<void> _disconnect(
    final BuildContext context,
    final SolanaWalletProvider provider,
  ) async {
    if (provider.adapter.isAuthorized) {
      await provider.disconnect(context);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = SolanaWalletProvider.of(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            icon: provider.adapter.isAuthorized
                ? const Icon(Icons.account_balance_wallet)
                : const Icon(Icons.account_balance_wallet_outlined),
            numOfitem: 0,
            press: () => provider.adapter.isAuthorized
                ? _disconnect(context, provider)
                : _connect(context, provider),
          ),
        ],
      ),
    );
  }
}
