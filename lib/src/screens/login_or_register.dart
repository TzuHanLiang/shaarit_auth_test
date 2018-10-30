import 'package:flutter/material.dart';

import '../presentation/shaarit_icons.dart';
import '../widgets/buttons/primary_setting_button.dart';
import '../widgets/buttons/secondary_login_button.dart';
import '../style/colors.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0.0, 1.0),
            end: Alignment(0.0, 0.0),
            colors: <Color>[
              const Color.fromRGBO(255, 78, 97, 1.0),
              const Color.fromRGBO(255, 8, 19, 0.98),
            ]),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 160.0,
            left: 97.0,
            child: Icon(
              Shaarit.logo_white,
              size: 180.0,
              color: white,
            ),
          ),
          Positioned(
            top: 426.0,
            left: 46.0,
            child: SecondaryLoginButton(
              '以電話號碼登入',
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
            ),
          ),
          Positioned(
            top: 502.0,
            left: 46.0,
            child: PrimarySettingButton(
              '新用戶',
              onPressed: () => Navigator.pushNamed(context, '/register'),
            ),
          ),
          Positioned(
            top: 725.0,
            left: 12.0,
            child: RawMaterialButton(
              constraints: BoxConstraints(minWidth: 350.0, minHeight: 44.0),
              fillColor: scarlet,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                'Terms & Privacy',
                style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "PingFangTC",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
