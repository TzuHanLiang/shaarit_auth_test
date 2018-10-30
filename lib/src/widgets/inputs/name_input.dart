import 'package:flutter/material.dart';

import '../../style/colors.dart';

class NameInput extends StatelessWidget {
  Widget build(BuildContext build) {
    return Container(
      child: TextField(
        cursorColor: cherryRed,
        style: TextStyle(
          color: black,
          fontWeight: FontWeight.w500,
          fontFamily: "DIN",
          fontStyle: FontStyle.normal,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey),
            borderRadius: BorderRadius.circular(22.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13.0, horizontal: 12.0),
        ),
      ),
      constraints: BoxConstraints(maxWidth: 280.0),
    );
  }
}
