import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:solana_wallet_provider/solana_wallet_provider.dart';

import 'routes.dart';
import 'screens/title/title_screen.dart';
import 'theme_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    switch (dotenv.env['http_cluster']!) {
      case 'localhost':
        _cluster = Cluster.localhost;
        break;
      case 'devnet':
        _cluster = Cluster.devnet;
        break;
      case 'testnet':
        _cluster = Cluster.testnet;
        break;
      case 'mainnet':
        _cluster = Cluster.mainnet;
        break;
      default:
        _cluster = Cluster.devnet;
    }
  }
  late final Cluster _cluster;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => SolanaWalletProvider.create(
        httpCluster: _cluster,
        identity: AppIdentity(
            uri: Uri.parse(dotenv.env['app_uri']!),
            icon: Uri.parse(dotenv.env['app_icon_uri']!),
            name: dotenv.env['app_name']!),
        child: ChangeNotifierProvider(
          create: (_) => ThemeManager(),
          child: Consumer<ThemeManager>(
            builder: (context, themeManager, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: dotenv.env['app_name']!,
              theme: ThemeManager.currentThemeData,
              initialRoute: TitleScreen.routeName,
              routes: routes,
            ),
          ),
        ),
      );
}
