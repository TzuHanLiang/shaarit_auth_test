import 'package:flutter/material.dart';

class BottomSheetLabel extends StatelessWidget {
  final String _label;
  BottomSheetLabel(this._label);

  Widget build(BuildContext context) {
    return Text(
      _label,
      style: const TextStyle(
        color: const Color(0xff4a4a4a),
        fontWeight: FontWeight.w400,
        fontFamily: "PingFangTC",
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      ),
    );
  }
}
