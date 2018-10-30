import 'package:flutter/material.dart';

class TabText extends StatelessWidget {
  final String _title;
  TabText(this._title);

  Widget build(BuildContext context) {
    return Text(
      _title,
      style: const TextStyle(
          color: const Color(0xffe10813),
          fontWeight: FontWeight.w500,
          fontFamily: "PingFangTC",
          fontStyle: FontStyle.normal,
          fontSize: 14.0),
    );
  }
}
