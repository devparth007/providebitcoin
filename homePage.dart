import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:providebitcoin/other.dart';
import 'Screen1/screen1.dart';
import 'screen2/screen2.dart';
import 'screen3/screen3.dart';
import 'screen4/screen4.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List Screens = [
    const Screen1(),
    const Other(),
    const Screen3(code: ''),
    const Screen4(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavyBar(
          onItemSelected: _onItemTapped,
          selectedIndex: _selectedIndex,
          animationDuration: const Duration(milliseconds: 200),
          curve: Curves.elasticInOut,
          containerHeight: 70,
          showElevation: true,
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home_outlined),
              title: const Text('Home'),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.account_balance_wallet_outlined),
              title: const Text('Wallet'),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.business_center_outlined),
              title: const Text('Market'),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Setting'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Screens[_selectedIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
