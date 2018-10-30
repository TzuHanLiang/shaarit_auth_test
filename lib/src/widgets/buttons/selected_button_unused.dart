import 'package:flutter/material.dart';
import '../../style/colors.dart';

class ShopListTopButton extends StatelessWidget {
  final Function onTap;
  final String _label;
  ShopListTopButton(this._label,{ this.onTap});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: new Container(
        margin: EdgeInsets.only(right:8.0),
        width: 60.0,
        height: 35.0,
        decoration: new BoxDecoration(
          border: new Border.all(color: grey),
          borderRadius: new BorderRadius.circular(18.5),
        ),
        child: new Center(
          child: Text(
            _label,
            style: const TextStyle(
                color: grey,
                fontWeight: FontWeight.w400,
                fontFamily: "PingFangTC",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
