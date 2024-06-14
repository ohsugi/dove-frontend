import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:solana_wallet_provider/solana_wallet_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../enums.dart';
import '../../../preferences.dart';
import '../../../theme_manager.dart';
import 'custom_list_tile.dart';
import 'simple_drop_down.dart';
import 'single_section.dart';

class Body extends StatefulWidget {
  Body({super.key});
  static const componentWidthPercentage = 0.5;
  static const String landingPageUri = 'https://github.com/ohsugi/dove';
  final TextEditingController nameController =
      TextEditingController(text: 'nameController');
  final TextEditingController socialMediaLinkController =
      TextEditingController(text: 'socialMediaLinkController');
  final TextEditingController evidenceLinkController =
      TextEditingController(text: 'evidenceLinkController');
  final TextEditingController createdDateController =
      TextEditingController(text: 'createdDateController');
  final TextEditingController updateDateController =
      TextEditingController(text: 'updateDateController');

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static bool isShown = false;

  @override
  void initState() => super.initState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final provider = SolanaWalletProvider.of(context);

    var urlColor = Colors.blue;
    void updateLocation(PointerEvent details) {
      setState(() {
        urlColor = Colors.red;
      });
    }

    void exitUrl(PointerEvent details) {
      setState(() {
        urlColor = Colors.blue;
      });
    }

    final Future<String> calculation = Future<String>.delayed(
      const Duration(seconds: 3),
      () => 'Loaded Data',
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder<String>(
        future: calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          bool loading = !snapshot.hasData && !snapshot.hasError;
          return Column(
            children: [
              const SizedBox(height: 20),
              SingleSection(
                title: 'User Information',
                children: [
                  CustomListTile(
                    title: 'Wallet',
                    icon: Icons.account_balance_wallet_outlined,
                    trailing: Text(
                      provider.adapter.isAuthorized
                          ? provider.adapter
                              .encodeAccount(provider.adapter.connectedAccount!)
                          : 'ウォレットを接続してください',
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomListTile(
                    title: 'Name',
                    icon: Icons.person_outline_rounded,
                    trailing: SizedBox(
                      width: screenSize.width * Body.componentWidthPercentage,
                      child: TextField(
                        controller: widget.nameController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          prefixIcon: provider.adapter.isAuthorized
                              ? loading
                                  ? const Icon(Icons.hourglass_top_outlined)
                                  : null
                              : const Icon(Icons.lock_outline_rounded),
                          hintText: provider.adapter.isAuthorized
                              ? snapshot.hasData
                                  ? snapshot.data!
                                  : snapshot.hasError
                                      ? '名前を入力してください...'
                                      : '読み込み中'
                              : 'ウォレットを接続してください',
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                        onChanged: (value) {
                          if (value.contains(' ')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('名前には空白を含められません'),
                              ),
                            );
                          }
                        },
                        readOnly: !provider.adapter.isAuthorized || loading,
                      ),
                    ),
                  ),
                  CustomListTile(
                    title: 'Social Media Link',
                    icon: Icons.smartphone_outlined,
                    trailing: SizedBox(
                      width: screenSize.width * Body.componentWidthPercentage,
                      child: TextField(
                        controller: widget.socialMediaLinkController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(
                            10.0,
                            0.0,
                            10.0,
                            0.0,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          prefixIcon: provider.adapter.isAuthorized
                              ? loading
                                  ? const Icon(Icons.hourglass_top_outlined)
                                  : null
                              : const Icon(Icons.lock_outline_rounded),
                          hintText: provider.adapter.isAuthorized
                              ? snapshot.hasData
                                  ? snapshot.data!
                                  : snapshot.hasError
                                      ? 'ソーシャルメディアリンクを入力してください...'
                                      : '読み込み中'
                              : 'ウォレットを接続してください',
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                        onChanged: (value) {
                          if (value.contains(' ')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('ソーシャルメディアリンクには空白を含められません'),
                              ),
                            );
                          }
                        },
                        readOnly: !provider.adapter.isAuthorized || loading,
                      ),
                    ),
                  ),
                  CustomListTile(
                    title: 'Evidence Link',
                    icon: Icons.link_outlined,
                    trailing: SizedBox(
                      width: screenSize.width * Body.componentWidthPercentage,
                      child: TextField(
                        controller: widget.evidenceLinkController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(
                            10.0,
                            0.0,
                            10.0,
                            0.0,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          prefixIcon: provider.adapter.isAuthorized
                              ? loading
                                  ? const Icon(Icons.hourglass_top_outlined)
                                  : null
                              : const Icon(Icons.lock_outline_rounded),
                          hintText: provider.adapter.isAuthorized
                              ? snapshot.hasData
                                  ? snapshot.data!
                                  : snapshot.hasError
                                      ? 'このユーザについて言及したソーシャルメディアリンクを入力してください...'
                                      : '読み込み中'
                              : 'ウォレットを接続してください',
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                        ),
                        onChanged: (value) {
                          if (value.contains(' ')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('ソーシャルメディアリンクには空白を含められません'),
                              ),
                            );
                          }
                        },
                        readOnly: !provider.adapter.isAuthorized || loading,
                      ),
                    ),
                  ),
                  CustomListTile(
                    title: 'Visibility on Campaign and Fundings',
                    icon: Icons.visibility_outlined,
                    trailing: Switch(
                      value: isShown,
                      onChanged: (value) {
                        setState(() {
                          if (!provider.adapter.isAuthorized || loading) return;
                          isShown = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              CustomListTile(
                title: 'Registration Date',
                icon: Icons.calendar_today_outlined,
                trailing: Text(
                  provider.adapter.isAuthorized
                      ? snapshot.hasData
                          ? snapshot.data!
                          : snapshot.hasError
                              ? widget.createdDateController.text
                              : '⌛読み込み中'
                      : 'ウォレットを接続してください',
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CustomListTile(
                title: 'Updated Date',
                icon: Icons.calendar_today_outlined,
                trailing: Text(
                  provider.adapter.isAuthorized
                      ? snapshot.hasData
                          ? snapshot.data!
                          : snapshot.hasError
                              ? widget.updateDateController.text
                              : '⌛読み込み中'
                      : 'ウォレットを接続してください',
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Divider(),
              SingleSection(
                title: 'General',
                children: [
                  CustomListTile(
                    title: 'Dark Mode',
                    icon: Icons.dark_mode_outlined,
                    trailing: Switch(
                      value: Preferences.darkMode,
                      onChanged: (value) {
                        setState(() {
                          ThemeManager().darkMode = value;
                        });
                      },
                    ),
                  ),
                  CustomListTile(
                    title: 'Notifications',
                    icon: Icons.notifications_none_rounded,
                    trailing: Switch(
                      value: Preferences.notifications,
                      onChanged: (value) {
                        setState(() {
                          Preferences.notifications = value;
                        });
                      },
                    ),
                  ),
                  CustomListTile(
                    title: 'Language',
                    icon: Icons.language_rounded,
                    trailing: SimpleDropDown(
                      initialSelectedIndex: myLanguageMap.keys
                          .toList()
                          .indexOf(Preferences.language),
                      itemList:
                          myLanguageMap.values.toList().map((e) => e).toList(),
                      onSelectedIndex: (index) {
                        setState(() {
                          Preferences.language = myLanguageMap.keys
                              .toList()
                              .map((e) => e)
                              .toList()[index];
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(),
              SingleSection(
                title: 'Information',
                children: [
                  CustomListTile(
                    title: 'Help & Feedback',
                    icon: Icons.help_outline_rounded,
                    trailing: MouseRegion(
                      onHover: updateLocation,
                      onExit: exitUrl,
                      child: SelectableText.rich(
                        TextSpan(
                          text: Body.landingPageUri,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: urlColor,
                                    decoration: TextDecoration.underline,
                                  ),
                          mouseCursor: SystemMouseCursors.click,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await canLaunch(Body.landingPageUri)
                                  ? await launch(Body.landingPageUri)
                                  : throw 'Could not launch ${Body.landingPageUri}';
                            },
                        ),
                      ),
                    ),
                  ),
                  CustomListTile(
                    title: 'Version',
                    icon: Icons.info_outline_rounded,
                    trailing: Text(
                      Preferences.versionString,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const CustomListTile(
                    title: 'Sign out',
                    icon: Icons.exit_to_app_rounded,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
