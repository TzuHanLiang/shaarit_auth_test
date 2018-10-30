import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/text_style/headline.dart';
import '../widgets/buttons/primary_setting_button.dart';
import '../widgets/inputs/verification_code.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen2State();
  }
}

class _LoginScreen2State extends State<LoginScreen2> {
  String _num;
  String _imei;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar('Login'),
          Container(
            margin: EdgeInsets.only(top: 50.0),
          ),
          Headline('請輸入支付密碼'),
          Container(
            margin: EdgeInsets.only(top: 6.0),
          ),
          Container(
            margin: EdgeInsets.only(top: 55.0),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 82.0),
              ),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
              VerificationCode(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 81.0),
          ),
          PrimarySettingButton(
            'Login', onPressed:
            () => Navigator.pushNamed(context, '/'),
          ),
        ],
      ),
    );
  }
}
