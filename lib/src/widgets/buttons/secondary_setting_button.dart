import 'package:flutter/material.dart';
import '../../style/colors.dart';
import '../text_style/button_text.dart';

class SecondarySettingButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  // final Function ontap;
  SecondarySettingButton({this.label, this.onPressed});

  Widget build(context) {
    
    return Theme(
      child: RaisedButton(
        elevation: 0.0,
        highlightElevation: 0.0,
        splashColor: lightestGray,
        disabledColor: Colors.transparent,
        disabledTextColor: grey,
        textColor: darkerGrey,
        onPressed: onPressed,
        child: ButtonText(label),
      ),
      data: Theme.of(context).copyWith(
        buttonColor: Colors.transparent,
        buttonTheme: ButtonThemeData(
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          height: 44.0,
          minWidth: 280.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
            side: BorderSide(
              color:  grey ,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
