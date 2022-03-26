import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:providebitcoin/screens/homePage.dart';

class FingerAuth extends StatefulWidget {
  const FingerAuth({Key? key}) : super(key: key);

  @override
  _FingerAuthState createState() => _FingerAuthState();
}

class _FingerAuthState extends State<FingerAuth> {
  bool isAuth = false;
  late List<BiometricType> availableBiometrics;

  checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    // bool canCheckBiometrics = false;
    // try {
    //   canCheckBiometrics = await auth.canCheckBiometrics;
    // } catch (e) {
    //   Fluttertoast.showToast(msg: "error biometrics $e");
    // }
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      Fluttertoast.showToast(msg: "error enumerate biometrics $e");
    }
    // if (availableBiometrics.isNotEmpty) {
    // } else {
    //   Fluttertoast.showToast(msg: "no biometrics are available");
    // }
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Touch your finger on the sensor to login',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      authenticated
          ? Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            }))
          : Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(msg: "error using biometric auth: $e");
    }
  }

  @override
  void initState() {
    checkBiometric();
    super.initState();
  }

  // @override
  // void dispose() {
  //   checkBiometric();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Center(
          child: OutlinedButton(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.fingerprint),
                  Text("Login with Fingerprint",
                      style: TextStyle(fontSize: 17.0, color: Colors.blue))
                ]),
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(width: 1.5, color: Colors.blue)),
            onPressed: checkBiometric,
          ),
        ),
      ),
    );
  }
}
