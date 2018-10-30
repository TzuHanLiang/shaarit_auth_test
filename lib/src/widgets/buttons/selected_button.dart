import 'package:flutter/material.dart';
import '../../style/colors.dart';

class SelectedButton extends StatefulWidget {
  final double minWidth;
  // final double maxWidth; //
  final double height;
  final double radius;
  // The button's fill color, while it's in default (unpressed, [enabled]) state
  final double elevation;
  final Color unselectedButtonColor;
  final Color selectedButtonColor;
  final String text;
  final Color unselectedTextColor;
  final Color selectedTextColor;
  final FontWeight textFontWeight;
  final double textFontSize;
  final FontStyle textFontStyle;
  final String textFontFamily;
  final Color unselectedBorderColor; //
  final Color selectedBorderColor; //
  final BorderStyle unselectedBorderStyle; //
  final BorderStyle selectedBorderStyle; //
  final double borderWidth;
  final VoidCallback onPressed;

  SelectedButton({
    // this.maxWidth = 60.0, //
    this.minWidth = 60.0, //
    this.height = 35.0, //
    this.radius = 18.5, //
    this.elevation = 0.0,
    // @required this.unselectedButtonColor,
    // @required this.selectedButtonColor,
    this.unselectedButtonColor = Colors.transparent,
    this.selectedButtonColor = cherryRed,
    @required this.text,
    // @required this.unselectedTextColor,
    // @required this.selectedTextColor,
    this.unselectedTextColor = grey,
    this.selectedTextColor = white,
    this.textFontWeight = FontWeight.w400, //
    this.textFontSize = 14.0, //
    this.textFontStyle = FontStyle.normal, //
    this.textFontFamily = "PingFangTC", //
    // @required this.unselectedBorderColor, //
    // @required this.selectedBorderColor, //
    this.selectedBorderColor = Colors.transparent,
    this.unselectedBorderColor = grey,
    // @required this.unselectedBorderStyle, //
    // @required this.selectedBorderStyle, //
    this.unselectedBorderStyle = BorderStyle.solid, //
    this.selectedBorderStyle = BorderStyle.none,
    this.borderWidth = 1.0, //
    @required this.onPressed,
  });

  @override
  _SelectedButtonState createState() => new _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  Color buttonColor;
  Color textColor;
  Color borderColor;
  BorderStyle borderStyle;

  @override
  void initState() {
    super.initState();
    buttonColor = widget.unselectedButtonColor;
    textColor = widget.unselectedTextColor;
    borderColor = widget.unselectedBorderColor;
    borderStyle = widget.unselectedBorderStyle;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: widget.minWidth,
      height: widget.height,
      child: _constructSelectedButton(),
    );
  }

  Widget _constructSelectedButton() {
    return RaisedButton(
      elevation: widget.elevation,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
          style: borderStyle,
          width: widget.borderWidth,
        ),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      onPressed: () {
        _changeColor();
        widget.onPressed();
      },
      child: Text(
        widget.text,
        style: TextStyle(
          color: textColor,
          fontWeight: widget.textFontWeight,
          fontSize: widget.textFontSize,
          fontFamily: widget.textFontFamily,
          fontStyle: widget.textFontStyle,
        ),
      ),
    );
  }

  void _changeColor() {
    setState(() {
      buttonColor = buttonColor == widget.unselectedButtonColor
          ? widget.selectedButtonColor
          : widget.unselectedButtonColor;

      textColor = textColor == widget.unselectedTextColor
          ? widget.selectedTextColor
          : widget.unselectedTextColor;

      borderColor = borderColor == widget.unselectedBorderColor
          ? widget.selectedBorderColor
          : widget.unselectedBorderColor;

      borderStyle = borderStyle == widget.unselectedBorderStyle
          ? widget.selectedBorderStyle
          : widget.unselectedBorderStyle;
    });
  }
}
