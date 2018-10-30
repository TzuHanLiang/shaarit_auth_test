import 'package:flutter/material.dart';

class ShopListCategoryLabel extends StatelessWidget {
  final String label;
  ShopListCategoryLabel(this.label);


  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
          color: const Color(0xff9b9b9b),
          fontWeight: FontWeight.w400,
          fontFamily: "PingFangTC",
          fontStyle: FontStyle.normal,
          fontSize: 14.0),
    );
  }
}
