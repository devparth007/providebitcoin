import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Webket extends ChangeNotifier {
  WebSocketChannel? channel;
  List _zero = [];
  List _one = [];
  List _two = [];
  List _three = [];

  List get zero {
    return _zero;
  }

  List get one {
    return _one;
  }

  List get two {
    return _two;
  }

  List get three {
    return _three;
  }

  Future<void> getSocketData() async {
    List dummy = [];
    final channel = WebSocketChannel.connect(
      Uri.parse(
          'wss://neonwebsocket.niqox.com/market/coinpair_selectcoinbymarket?marketid=1&coinid=3'),
    );

    channel.stream.listen(
      (data) {
        dummy = json.decode(data);
        _zero = dummy[0];
        _one = dummy[1];
        _two = dummy[2];
        _three = dummy[3];
        notifyListeners();
      },
      onDone: () {
        //       channel.sink.close();
        debugPrint(
            'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      },
      onError: (_error) => Fluttertoast.showToast(msg: _error),
    );
  }
}
