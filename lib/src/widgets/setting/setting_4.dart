import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/primary_setting_button.dart';
import '../buttons/secondary_setting_button.dart';

class Setting4 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('開啟定位'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead('尋找優惠店家，與朋友推薦couopn更方便!'),
          Container(
            margin: EdgeInsets.only(top: 26.5),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 80.0, maxHeight: 80.0),
            child: Image.asset('assets/images/grGps@3x.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 27.5),
          ),
          PrimarySettingButton('Allow GPS'),
          Container(
            margin: EdgeInsets.only(top: 6.0),
          ),
          SecondarySettingButton(label:'Not Now', onPressed: (){},),
        ],
      ),
    );
  }
}
