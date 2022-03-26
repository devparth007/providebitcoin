import 'package:flutter/material.dart';
import 'package:providebitcoin/Notifires/webSocketNotifier.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({
    Key? key,
  }) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  void initState() {
    Provider.of<Webket>(context, listen: false).getSocketData();
    super.initState();
  }
  //
  // @override
  // void dispose() {
  //   Provider.of<Webket>(context, listen: false).close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final socket = Provider.of<Webket>(context);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: socket.two.length,
                itemBuilder: (context, index) {
                  print(socket.two);
                  return ListTile(
                      onTap: () {},
                      title: Text(socket.two[index]["quantity"].toString()),
                      subtitle: Text(socket.two[index]["price"].toString()),
                      leading: Text(socket.two[index]["coinid"].toString()),
                      trailing:
                          Text(socket.two[index]["tradetype"].toString()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
