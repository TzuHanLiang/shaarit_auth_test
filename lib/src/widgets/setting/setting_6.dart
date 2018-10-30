import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/primary_setting_button.dart';
import '../buttons/secondary_setting_button.dart';

class Setting6 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('設定 Touch ID or Face ID'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead('您將可用透過指紋或是臉部辨識支付與轉帳'),
          Container(
            margin: EdgeInsets.only(top: 26.5),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 80.0, maxHeight: 80.0),
            child: Image.asset('assets/images/grid@3x.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 27.5),
          ),
          PrimarySettingButton('Enable'),
          Container(
            margin: EdgeInsets.only(top: 6.0),
          ),
          SecondarySettingButton(label:'Not Now', onPressed: (){},),
        ],
      ),
    );
  }
}
