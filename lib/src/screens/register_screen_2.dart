import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/text_style/headline.dart';
import '../widgets/text_style/subhead.dart';
import '../widgets/buttons/primary_setting_button.dart';
import '../widgets/buttons/secondary_setting_button.dart';
import '../widgets/inputs/verification_code.dart';

class RegisterScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen2State();
  }
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  String _num;
  String _imei;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar('Register'),
          Container(
            margin: EdgeInsets.only(top: 50.0),
          ),
          Headline('請輸入驗證碼'),
          Container(
            margin: EdgeInsets.only(top: 6.0),
          ),
          Subhead("已發送至 $_num.."),
          Container(
            margin: EdgeInsets.only(top: 18.0),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.0),
              ),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 24.0),
          ),
          PrimarySettingButton(
            'Next', onPressed:
            () => Navigator.pushReplacementNamed(context, '/settings'),
          ),
          Container(
            margin: EdgeInsets.only(top: 7.0),
          ),
          SecondarySettingButton(
            label:'沒收到？重新發送(??)',
            onPressed:
            () => Navigator.pushReplacementNamed(context, '/register'),
          ),
        ],
      ),
    );
  }
}
