import 'package:flutter/material.dart';
import '../../style/colors.dart';
import '../text_style/button_text.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  PrimaryButton(this.label);

  Widget build(context) {
    return Theme(
      child: RaisedButton(
        highlightElevation: 0.0,
        elevation: 0.0,
        disabledColor: lightestGray,
        disabledTextColor: grey,
        textColor: white,
        splashColor: scarlet,
        onPressed: () {},
        child: ButtonText(label),
      ),
      data: Theme.of(context).copyWith(
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
            side: BorderSide(
              color: darkerGrey,
              style: BorderStyle.none,
              width: 1.0,
            ),
          ),
          height: 44.0,
          minWidth: 160.0,
        ),
        buttonColor: cherryRed,
      ),
    );
  }
}
