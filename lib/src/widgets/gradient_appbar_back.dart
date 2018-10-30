import 'package:flutter/material.dart';
import '../style/colors.dart';
import 'gradient_appbar.dart';

//better be used in Column
class GradientAppBarBack extends StatelessWidget {
  final String title;
  GradientAppBarBack({this.title});
  
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              constraints:
                  BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: GradientAppBar(title),
            ),
          ),
          Positioned(
            top: 40.0,
            left: 0.0,
            child: BackButton(color: white),
          ),
        ],
      ),
    );
  }
}
