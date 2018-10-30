import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show Client;
import 'src/models/todo_model.dart';
import 'src/screens/login_or_register.dart';
import 'src/screens/login_screen_1.dart';
import 'src/screens/login_screen_2.dart';
import 'src/screens/register_screen_1.dart';
import 'src/screens/register_screen_2.dart';
import 'src/screens/setting_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Client client = Client();

  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginOrRegisterScreen(),
      routes: {
        '/': (BuildContext context) => LoginOrRegisterScreen(),
        '/register': (BuildContext context) => RegisterScreen1(),
        '/varification': (BuildContext context) => RegisterScreen2(),
        '/login': (BuildContext context) => LoginScreen1(),
        '/confirmation': (BuildContext context) => LoginScreen2(),
        '/settings': (BuildContext context) => SettingScreen(),
      },
    );
  }
}
