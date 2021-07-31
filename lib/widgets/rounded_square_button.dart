import 'package:flutter/material.dart';

class RoundedSquareButton extends StatelessWidget {

  final String buttonText;
  final Color? textColor;
  final Color? backgroundColor;
  final Function() onPressedCallback;
  final double? fontSize;

  RoundedSquareButton({required this.buttonText, this.backgroundColor, this.textColor, required this.onPressedCallback, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        buttonText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          fontSize: fontSize,
        ),
      ),
      style: ButtonStyle(
        foregroundColor:textColor == null ? MaterialStateProperty.all(Theme.of(context).textTheme.button!.color) : MaterialStateProperty.all(textColor),
        backgroundColor: backgroundColor == null ? MaterialStateProperty.all(Theme.of(context).primaryColor) : MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onPressedCallback,
    );
  }
}

class RoundedSquareButtonWithIcon extends StatelessWidget {

  final String buttonText;
  final Function() onPressedCallback;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final IconData icon;

  RoundedSquareButtonWithIcon({required this.buttonText, required this.icon, this.backgroundColor, this.textColor, this.fontSize = 14, required this.onPressedCallback,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 5,),
          Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        foregroundColor:textColor == null ? MaterialStateProperty.all(Theme.of(context).textTheme.button!.color) : MaterialStateProperty.all(textColor),
        backgroundColor: backgroundColor == null ? MaterialStateProperty.all(Theme.of(context).primaryColor) : MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onPressedCallback,
    );
  }
}