import 'package:flutter/material.dart';

class StrokedTextWidget extends StatelessWidget {
  const StrokedTextWidget(
      {Key? key, required this.text, required this.fontSize, required this.internColor, required this.strokeColor, this.fontStyle})
      : super(key: key);
  final String text;
  final double? fontSize;
  final Color internColor;
  final Color strokeColor;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 0.5
              ..color = strokeColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: fontSize,
            color: internColor,
          ),
        ),
      ],
    );
  }
}
