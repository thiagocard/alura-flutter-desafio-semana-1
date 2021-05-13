import 'package:flutter/material.dart';

class TextWithStroke extends StatelessWidget {
  final String _text;

  TextWithStroke(this._text);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          _text,
          style: TextStyle(
            fontSize: 22,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
          ),
        ),
        // Solid text as fill.
        Text(
          _text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }

}
