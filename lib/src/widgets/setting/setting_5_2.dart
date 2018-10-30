import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/secondary_setting_button.dart';
import '../inputs/verification_code.dart';

class Setting52 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('再次確認支付pincode'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead('Pincode 將用以享享幣的支付與轉帳'),
           Container(
            margin: EdgeInsets.only(top: 33.0),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 55.0),
              ),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 82.0),
          ),
          SecondarySettingButton(label:'Not Now', onPressed: (){},),
        ],
      ),
    );
  }
}
