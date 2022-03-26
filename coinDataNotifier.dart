import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CoinData extends ChangeNotifier {
  List _coin = [];

  List get coin {
    return _coin;
  }

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  Future<void> getData(context) async {
    try {
      final response = await http.get(Uri.parse(
          'https://min-api.cryptocompare.com/data/top/totalvolfull?limit=100&tsym=USD&api_key=4d25360b307f0bc9884e830a4a7b11c9feb36ed09d91fbb83262968138812505'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _coin = data["Data"];
        _listKey.currentState
            ?.insertItem(0, duration: const Duration(seconds: 20));

        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: "Something went wrong");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
