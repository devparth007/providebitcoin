import 'package:flutter/material.dart';

class CoinInfo extends StatelessWidget {
  final String text1;
  final String text2;
  const CoinInfo({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEEEE),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1, style: TextStyle(color: Colors.grey[600])),
          Text(text2)
        ],
      ),
    );
  }
}
