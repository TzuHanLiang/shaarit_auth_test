import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/primary_setting_button.dart';


class Setting2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('選擇顯示頭像'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead(''),
          Container(
            margin: EdgeInsets.only(top: 70.5),
          ),
         
          Container(
            margin: EdgeInsets.only(top: 118.0),
          ),
          PrimarySettingButton('Next'),
        ],
      ),
    );
  }
}
