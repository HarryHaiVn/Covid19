import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidgetCommon extends StatelessWidget {
  EdgeInsets padding;
  String text;
  Color color;
  double size;
  FontStyle font;
  FontWeight fontWeight = FontWeight.normal;

  TextWidgetCommon(this.padding, this.text, this.color, this.size, this.font,
      [this.fontWeight]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontStyle: font,
            fontWeight: fontWeight),
      ),
    );
  }
}
