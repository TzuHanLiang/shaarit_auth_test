import 'package:flutter/material.dart';

class ShopListDetailAmount extends StatelessWidget {
  final String title;
  final String amount;
  ShopListDetailAmount(this.title, this.amount);
  build(BuildContext context) {
    return Text(
      "$title : $amount% ",
      style: const TextStyle(
          color: const Color(0xffe10813),
          fontWeight: FontWeight.w500,
          fontFamily: "PingFangTC",
          fontStyle: FontStyle.normal,
          fontSize: 12.0),
    );
  }
}
