import 'package:flutter/material.dart';
import '../../style/colors.dart';
import '../text_style/button_text.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  SecondaryButton(this.label);

  Widget build(context) {
    bool enable = true;
    return Theme(
      child: RaisedButton(
        elevation: 0.0,
        highlightElevation: 0.0,
        splashColor: lightestGray,
        disabledColor: Colors.transparent,
        disabledTextColor: grey,
        textColor: darkerGrey,
        onPressed: () {},
        child: ButtonText(label),
      ),
      data: Theme.of(context).copyWith(
        buttonColor: Colors.grey[50],
        buttonTheme: ButtonThemeData(
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          height: 44.0,
          minWidth: 160.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
            side: BorderSide(
              color: enable ? grey : lightestGray,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
