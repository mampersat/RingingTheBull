import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  double animationValue;

  BigButton({this.text, this.color, this.onPressed, this.animationValue});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: color,
        onPressed: onPressed,
        child:
            Text(text, style: TextStyle(fontSize: 50 + (50 * animationValue))),
      ),
    );
  }
}
