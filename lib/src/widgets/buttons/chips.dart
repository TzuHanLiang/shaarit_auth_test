import 'package:flutter/material.dart';
import '../../style/colors.dart';

class Chips extends StatelessWidget {
  Widget build(context) {
    bool enable = true;
    return Theme(
      child: RaisedButton(
        elevation: 0.0,
        highlightElevation: 0.0,
        disabledColor: Colors.transparent,
        disabledTextColor: grey,
        textColor: white,
        onPressed: () {},
        child: new Text(
          "Active",
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "PingFangTC",
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
          ),
        ),
      ),
      data: Theme.of(context).copyWith(
        buttonColor: cherryRed,
        buttonTheme: ButtonThemeData(
          height: 35.0,
          minWidth: 80.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.5),
            side: BorderSide(
              color: grey,
              style: enable ? BorderStyle.none : BorderStyle.solid,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
