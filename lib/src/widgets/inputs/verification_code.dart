import 'package:flutter/material.dart';

import '../../style/colors.dart';

class VerificationCode extends StatelessWidget {
  Widget build(BuildContext build) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      constraints: BoxConstraints(
        maxWidth: 36.0,
        minHeight: 72.0,
      ),
      child: TextField(
        cursorColor: cherryRed,
        style: const TextStyle(
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
          fontFamily: "DIN",
          fontStyle: FontStyle.normal,
          fontSize: 40.0,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 9.0, horizontal: 4.0),
        ),
      ),
    );
  }
}
