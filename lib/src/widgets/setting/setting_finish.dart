import 'package:flutter/material.dart';

import '../text_style/headline.dart';
import '../text_style/subhead.dart';
import '../buttons/primary_setting_button.dart';

class SettingFinish extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Headline('Ready to go!'),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Subhead('您已經準備好進入 Shariit 囉 !'),
          Container(
            margin: EdgeInsets.only(top: 26.5),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 80.0, maxHeight: 80.0),
            child: Image.asset('assets/images/girl3@3x.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 80.0),
          ),
          PrimarySettingButton(
            'Finish',
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
