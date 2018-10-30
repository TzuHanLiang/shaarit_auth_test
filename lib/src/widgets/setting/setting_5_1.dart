import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/secondary_setting_button.dart';
import '../inputs/verification_code.dart';

class Setting51 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('請設定支付密碼'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead('以享享幣支付轉帳時需要支付密碼'),
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
