import 'package:flutter/material.dart';
import '../..//style/colors.dart';

class Headline extends StatelessWidget {
  final String _text;
  // final bool color;
  Headline(
    this._text,
  );

  Widget build(BuildContext context) {
    return new Text(
      _text,
      style: const TextStyle(
        color: black,
        fontWeight: FontWeight.w500,
        fontFamily: "PingFangTC",
        fontStyle: FontStyle.normal,
        fontSize: 18.0,
      ),
    );
  }
}
