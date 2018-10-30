import 'package:flutter/material.dart';

class ShopListDetailShop extends StatelessWidget {
  final String _category, _shopName;
  ShopListDetailShop(this._category, this._shopName);

  Widget build(BuildContext context) {
    return new RichText(
        text: new TextSpan(
            children: [
          new TextSpan(
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: "PingFangTC",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              text: "$_category- "),
          new TextSpan(
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: "PingFangTC",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              text: "$_shopName")
        ]));
  }
}
