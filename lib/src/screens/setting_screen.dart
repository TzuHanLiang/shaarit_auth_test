import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/setting/setting_1.dart';
import '../widgets/setting/setting_2.dart';
import '../widgets/setting/setting_3.dart';
import '../widgets/setting/setting_4.dart';
import '../widgets/setting/setting_5_1.dart';
import '../widgets/setting/setting_5_2.dart';
import '../widgets/setting/setting_6.dart';
import '../widgets/setting/setting_finish.dart';
import '../widgets/setting/setting_stepper.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar('Settings'),
          Container(
            margin: EdgeInsets.only(top: 24.0),
          ),
          SettingStepper(
            steps: <Widget>[
              Setting1(),
              Setting2(),
              Setting3(),
              Setting4(),
              Setting51(),
              Setting52(),
              Setting6(),
              SettingFinish(),
            ],
          )
        ],
      ),
    );
  }
}
