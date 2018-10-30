import 'package:flutter/material.dart';
import '../../style/colors.dart';

class Subhead extends StatelessWidget {
  final String _text;
  // final bool color;
  Subhead(
    this._text,
  );

  Widget build(BuildContext context) {
    return new Text(
      _text,
      style: const TextStyle(
        color: grey,
        fontWeight: FontWeight.w400,
        fontFamily: "PingFangTC",
        fontStyle: FontStyle.normal,
        fontSize: 14.0,
      ),
    );
  }
}
