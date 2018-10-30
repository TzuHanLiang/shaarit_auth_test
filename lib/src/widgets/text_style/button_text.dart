import 'package:flutter/material.dart';
export 'button_text.dart';

class ButtonText extends StatelessWidget {
  final String label;
  ButtonText(this.label,);

  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: "PingFangTC",
        fontStyle: FontStyle.normal,
        fontSize: 15.0,
      ),
    );
  }
}
