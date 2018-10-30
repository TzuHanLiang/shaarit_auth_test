import 'package:flutter/material.dart';
import 'text_style/appbar_title.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 36.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: new Center(
        child: new AppBarTitle(title),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: const Alignment(0.0, 0.0),
          end: const Alignment(0.0, 1.0),
          colors: <Color>[
            const Color.fromRGBO(255, 78, 97, 1.0),
            const Color.fromRGBO(255, 8, 19, 0.98),
          ],
        ),
      ),
    );
  }
}
