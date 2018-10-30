import '../../style/colors.dart';
import 'package:flutter/material.dart';


// Adapted from https://pub.dartlang.org/packages/masked_text

class MaskedTextField extends StatefulWidget {
  final TextEditingController maskedTextFieldController;
  final ValueSetter<String> onSubmitted;

  final String mask;
  final String escapeCharacter;

  // final int maxLength;
  final TextInputType keyboardType;
  final InputDecoration inputDecoration;
  final TextAlign textAlign;
  final TextStyle style;
  final Color cursorColor;

  const MaskedTextField(
      {Key key,
      this.mask,
      this.style,
      this.textAlign,
      this.cursorColor: cherryRed,
      this.maskedTextFieldController,
      this.onSubmitted,
      this.escapeCharacter: 'x',
      // this.maxLength: 100,
      this.keyboardType: TextInputType.number,
      this.inputDecoration: const InputDecoration()})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MaskedTextFieldState();
}

class MaskedTextFieldState extends State<MaskedTextField> {
  @override
  Widget build(BuildContext build) {
    var lastTextSize = 0;

    return Container(
      //constraint the textField size
      constraints: BoxConstraints(maxWidth: 214.0),
      child: TextField(
        controller: widget.maskedTextFieldController,
        // maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        cursorColor: widget.cursorColor,
        textAlign: widget.textAlign ?? TextAlign.start,
        style: widget.style ??
            TextStyle(
              color: black,
              fontWeight: FontWeight.w500,
              fontFamily: "DIN",
              fontStyle: FontStyle.normal,
              fontSize: 15.0,
            ),
        decoration: widget.inputDecoration ??
            InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: grey),
                borderRadius: BorderRadius.circular(22.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 12.0),
            ),
        //Use a dot (.) to refer to an instance variable or method, Use ?. instead of . to avoid an exception when the leftmost operand is null:
        // Conditional member access
        onSubmitted: (String text) => widget?.onSubmitted(text),
        onChanged: (String text) {
          // Deleting/removing
          if (text.length < lastTextSize) {
            if (widget.mask[text.length] != widget.escapeCharacter) {
              widget.maskedTextFieldController.selection =
                  new TextSelection.fromPosition(new TextPosition(
                      offset: widget.maskedTextFieldController.text.length));
            }
          } else {
            // Typing
            if (text.length >= lastTextSize) {
              var position = text.length;

              if ((widget.mask[position - 1] != widget.escapeCharacter) &&
                  (text[position - 1] != widget.mask[position - 1])) {
                widget.maskedTextFieldController.text = _buildText(text);
              }

              if (widget.mask[position] != widget.escapeCharacter)
                widget.maskedTextFieldController.text =
                    "${widget.maskedTextFieldController.text}${widget.mask[position]}";
            }

            // Android's onChange resets cursor position (cursor goes to 0)
            // so you have to check if it was reset, then put in the end
            // as iOS bugs if you simply put it in the end
            if (widget.maskedTextFieldController.selection.start <
                widget.maskedTextFieldController.text.length) {
              widget.maskedTextFieldController.selection =
                  new TextSelection.fromPosition(new TextPosition(
                      offset: widget.maskedTextFieldController.text.length));
            }
          }

          // Updating cursor position
          lastTextSize = widget.maskedTextFieldController.text.length;
        },
      ),
    );
  }

  String _buildText(String text) {
    var result = "";

    for (int i = 0; i < text.length - 1; i++) {
      result += text[i];
    }

    result += widget.mask[text.length - 1];
    result += text[text.length - 1];

    return result;
  }

  String get unmaskedText {
    final filteredMasks = widget.mask
        .splitMapJoin(widget.escapeCharacter, onMatch: (m) => "")
        .split("");
    String text = widget.maskedTextFieldController.text.trim();
    for (String character in filteredMasks) {
      text = text.replaceAll(character, "");
    }
    return text;
  }
}
