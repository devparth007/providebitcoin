import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:providebitcoin/Notifires/coinDataNotifier.dart';
import 'package:providebitcoin/screens/screen3/Screen3DetailPage.dart';
import 'package:providebitcoin/screens/screen3/qrView.dart';
import 'package:providebitcoin/screens/screen3/search.dart';
import 'package:provider/provider.dart';

class Screen3 extends StatefulWidget {
  final String code;

  const Screen3({Key? key, required this.code}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final bool _isLoading = false;

  @override
  void initState() {
    Provider.of<CoinData>(context, listen: false).getData(context);
    _key.currentState
        ?.insertItem(0, duration: const Duration(milliseconds: 500));
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationController.forward();
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
      appBar: AppBar(
        title: Text(widget.code),
        backgroundColor: Colors.grey[700],
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.to(() => const QRViewExample());
            },
            icon: const Icon(Icons.qr_code_scanner)),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.coin.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 575),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  curve: Curves.linear,
                                  type: PageTransitionType.topToBottom,
                                  duration: const Duration(milliseconds: 1500),
                                  child: DataPage(info: [data.coin[index]]),
                                ),
                              );
                            },
                            child: Container(
                              height: 110,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  top: 15, right: 10, left: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: const DecorationImage(
                                            image:
                                                AssetImage('assets/bitt.png'),
                                            fit: BoxFit.cover,
                                          ))),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(data.coin[index]
                                                    ["CoinInfo"]["FullName"])),
                                            Text(data.coin[index]["CoinInfo"]
                                                ["Name"])
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                        Row(children: [
                                          data.coin[index]["RAW"] == null
                                              ? const Text('')
                                              : Text(
                                                  'Q ${data.coin[index]["RAW"]["USD"]["SUPPLY"]}'
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[500])),
                                          const SizedBox(width: 10),
                                        ]),
                                        Row(
                                          children: [
                                            data.coin[index]["DISPLAY"] == null
                                                ? const Text('')
                                                : Text(
                                                    data.coin[index]["DISPLAY"]
                                                            ["USD"]["LOWDAY"]
                                                        .toString()
                                                        .substring(0, 6),
                                                    style: const TextStyle(
                                                        color: Colors.red)),
                                            const SizedBox(width: 10),
                                            data.coin[index]["DISPLAY"] == null
                                                ? const Text('')
                                                : Text(data.coin[index]
                                                        ["DISPLAY"]["USD"]
                                                        ["PRICE"]
                                                    .toString()
                                                    .substring(0, 6)),
                                            const SizedBox(width: 10),
                                            data.coin[index]["DISPLAY"] == null
                                                ? const Text('')
                                                : Text(
                                                    data.coin[index]["DISPLAY"]
                                                            ["USD"]["HIGHDAY"]
                                                        .toString()
                                                        .substring(0, 6),
                                                    style: const TextStyle(
                                                        color: Colors.green))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
