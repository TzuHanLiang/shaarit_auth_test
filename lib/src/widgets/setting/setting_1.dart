import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/primary_setting_button.dart';
import '../inputs/name_input.dart';

class Setting1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('請問你的名字是?'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead('推薦 Coupon 時使用'),
          Container(
            margin: EdgeInsets.only(top: 26.5),
          ),
          NameInput(),
          Container(
            margin: EdgeInsets.only(top: 118.0),
          ),
          PrimarySettingButton('Next'),
        ],
      ),
    );
  }
}
