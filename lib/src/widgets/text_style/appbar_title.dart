import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String _title;
  AppBarTitle(this._title);

  Widget build(BuildContext context) {
    return Text(
      _title,
      style: const TextStyle(
        color: const Color(0xffffffff),
        fontWeight: FontWeight.w700,
        fontFamily: "ArialRoundedMT",
        fontStyle: FontStyle.normal,
        fontSize: 17.0,
      ),
    );
  }
}
