import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:providebitcoin/Notifires/darkThemeNotifier.dart';
import 'package:providebitcoin/Notifires/webSocketNotifier.dart';
import 'package:provider/provider.dart';
import 'Notifires/coinDataNotifier.dart';
import 'auth/fingerAuth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoinData>(create: (context) => CoinData()),
        ChangeNotifierProvider<Webket>(create: (context) => Webket()),
        ChangeNotifierProvider(
          create: (context) => ThemeModel(),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeModel>(context);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme:
                  themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
              home: const FingerAuth(),
            );
          },
        )
      ],
    );
  }
}
