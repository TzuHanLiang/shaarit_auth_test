import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  final Function onTap;
  final Widget child;

  BottomSheetButton( {this.onTap, this.child});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: new Container(
        // margin: EdgeInsets.only(left: 8.0),
        // width: 60.0,
        constraints: BoxConstraints(maxWidth:85.0),
        height: 16.0,
        child: child,
      ),
    );
  }
}
