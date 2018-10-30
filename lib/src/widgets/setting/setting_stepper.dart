import 'package:flutter/material.dart';
import '../../style/colors.dart';

class SettingStepper extends StatefulWidget {
  final List<Widget> steps;

  SettingStepper({this.steps});

  @override
  State createState() => new SettingStepperState();
}

class SettingStepperState extends State<SettingStepper>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(bottom: 7.0),
          constraints: BoxConstraints(maxWidth: 326.0, maxHeight: 335.0),
          child: new TabBarView(
            children: widget.steps,
            controller: _controller,
          ),
        ),
        new Container(
          constraints: BoxConstraints(maxWidth: 335.0, minHeight: 10.0),
          child: Row(
            children: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 32.0,
                  ),
                  onPressed: _controller.index > 0
                      ? () {
                          _controller.animateTo(_controller.index - 1);
                        }
                      : null),
              new Expanded(
                child: new Center(
                  child: new TabPageSelector(
                    selectedColor: cherryRed,
                    controller: _controller,
                  ),
                ),
              ),
              new IconButton(
                  icon: new Icon(
                    Icons.arrow_forward,
                    size: 32.0,
                  ),
                  onPressed: _controller.index < _controller.length - 1
                      ? () {
                          _controller.animateTo(_controller.index + 1);
                        }
                      : null),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: widget.steps.length, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }
}