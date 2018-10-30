import 'package:flutter/material.dart';

class ShopListDetailVisit extends StatelessWidget {
  final String visitStatus;
  ShopListDetailVisit(this.visitStatus);

  Widget build(BuildContext context) {
    return new Text(
    "$visitStatus",
    style: const TextStyle(
    color:  const Color(0xff9b9b9b),
    fontWeight: FontWeight.w500,
    fontFamily: "PingFangTC",
    fontStyle:  FontStyle.normal,
    fontSize: 12.0
  ));
  }
}
