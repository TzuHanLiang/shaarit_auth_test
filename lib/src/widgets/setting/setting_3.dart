import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/primary_setting_button.dart';
import '../buttons/secondary_setting_button.dart';

class Setting3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('隨時通知我'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead('當朋友推薦 coupon 時請通知我'),
          Container(
            margin: EdgeInsets.only(top: 26.5),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 80.0, maxHeight: 80.0),
            child: Image.asset('assets/images/grNotice@3x.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 27.5),
          ),
          PrimarySettingButton('I want it !'),
          Container(
            margin: EdgeInsets.only(top: 6.0),
          ),
          SecondarySettingButton(label:'Not Now', onPressed: (){},),
        ],
      ),
    );
  }
}
