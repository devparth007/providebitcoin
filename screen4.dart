import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:providebitcoin/screens/screen4/location_and_device_details.dart';
import 'package:providebitcoin/screens/screen4/qrCode.dart';
import 'package:provider/provider.dart';

import '../../Notifires/darkThemeNotifier.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> with SingleTickerProviderStateMixin {
  bool _switchValue = true;
  bool _darkModeON = true;
  late AnimationController _animationController;

  void _handleOnPressed() {
    setState(() {
      _darkModeON = !_darkModeON;
      _darkModeON
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              title: const Text('User Data'),
              subtitle: const Text('Location and device details'),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                Get.to(() => const Location_and_device_details());
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('User Verification'),
              subtitle:
                  const Text('Complete your KYC to buy, sell and withdraw'),
              leading: const Icon(Icons.account_circle),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
                title: const Text('Bank Details'),
                subtitle: const Text(
                    'This account is used to facilities all your deposit and withdrawals'),
                leading: const Icon(Icons.account_balance),
                onTap: () {}),
            const Divider(),
            ListTile(
                title: const Text('History'),
                subtitle: const Text('all your transactions on CryptoSwitch'),
                leading: const Icon(Icons.history),
                onTap: () {}),
            const Divider(),
            ListTile(
              title: _darkModeON
                  ? const Text('Light Theme')
                  : const Text('Dark Theme'),
              leading: RotationTransition(
                turns:
                    Tween(begin: 0.0, end: 1.0).animate(_animationController),
                child: Icon(_darkModeON
                    ? (Icons.light_mode)
                    : (Icons.dark_mode_rounded)),
              ),
              trailing: CupertinoSwitch(
                value: themeProvider.isDark ? false : true,
                onChanged: (value) async {
                  themeProvider.isDark
                      ? themeProvider.isDark = false
                      : themeProvider.isDark = true;
                  setState(() {
                    _handleOnPressed();
                  });
                },
              ),
            ),
            const Divider(),
            ListTile(
                title: const Text('Refer & Earn'),
                subtitle: const Text(
                    'Get 50 BTC When your friend completes KYC & 100 BTC....'),
                leading: const Icon(Icons.compare_arrows),
                onTap: () {}),
            const Divider(),
            ListTile(
                title: const Text('Help and Support'),
                subtitle: const Text('Create a ticket and We will contact you'),
                leading: const Icon(Icons.help_outline_sharp),
                onTap: () {}),
            const Divider(),
            ListTile(
                title: const Text('Biometrics Logins'),
                leading: const Icon(Icons.fingerprint_outlined),
                trailing: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                )),
            const Divider(),
            ListTile(
                title: const Text('Rate US'),
                subtitle: const Text('Tell us what you think'),
                leading: const Icon(Icons.star),
                onTap: () {}),
            const Divider(),
            ListTile(
                title: const Text('About CryptoSwitch'),
                subtitle: const Text('v1.0.0'),
                leading: const Icon(Icons.help_outline_sharp),
                onTap: () {}),
            const Divider(),
            ListTile(
              title: const Text('Get QRCode'),
              subtitle: const Text('scan'),
              leading: const Icon(Icons.qr_code_sharp),
              onTap: () {
                Get.to(() => const QRCode());
              },
            ),
          ],
        ),
      ),
    );
  }
}
