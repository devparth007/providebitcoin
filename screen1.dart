import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:providebitcoin/Notifires/coinDataNotifier.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'inAppWebViewExample.dart';
import 'webView.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  myWallet() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            height: 130,
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              color: const Color(0xFFEFEEEE),
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    Provider.of<CoinData>(context, listen: false).getData(context);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    Timer(const Duration(milliseconds: 200),
        () => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CoinData>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            FadeTransition(
              opacity: _animationController,
              child: Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Parth Vaghasiya',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Icon(Icons.person, color: Colors.white, size: 35)
                      ],
                    ),
                    const Text('**** **** **** 3082',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('232,152 USD',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Icon(Icons.more_vert_outlined,
                            color: Colors.white, size: 35)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Image(
                              image: AssetImage('assets/deposit.png'),
                              height: 30,
                              width: 30,
                              color: Colors.white),
                          const SizedBox(width: 5),
                          AnimatedTextKit(
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              TyperAnimatedText('Deposit',
                                  speed: const Duration(milliseconds: 100))
                            ],
                          )
                        ]),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Image(
                              image: AssetImage('assets/withdraw.png'),
                              height: 30,
                              width: 30,
                              color: Colors.white),
                          const SizedBox(width: 5),
                          AnimatedTextKit(
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              TyperAnimatedText('Withdraw',
                                  speed: const Duration(milliseconds: 100))
                            ],
                          )
                        ]),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
            ),
            const Text(
              'My Wallet',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            myWallet(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(() => const WebViewExample());
                    },
                    child: const Text('WebView ->')),
                TextButton(
                    onPressed: () {
                      Get.to(() => const InAppWebViewExample());
                    },
                    child: const Text('InAppWebView ->'))
              ],
            ),
            const Text(
              'Top Volume',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: ScrollSnapList(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: data.coin.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 130,
                    height: 150,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    padding: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(children: [
                      const Image(
                          image: AssetImage('assets/bitt.png'),
                          width: 50,
                          height: 50),
                      const SizedBox(height: 10),
                      Text(data.coin[index]["CoinInfo"]["Name"],
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      data.coin[index]["DISPLAY"] == null
                          ? const Text('')
                          : Text(data.coin[index]["DISPLAY"]["USD"]["PRICE"]
                              .toString()
                              .substring(0, 6)),
                    ]),
                  );
                },
                dynamicItemSize: true,
                itemSize: 150,
                onItemFocus: (int) {},
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
