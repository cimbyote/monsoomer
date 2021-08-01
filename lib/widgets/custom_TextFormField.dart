import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? initialText;
  final int maxLength;
  final Function(String) callback;

  CustomTextFormField(
      {this.initialText,
        required this.callback,
        this.maxLength = 100});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialText,
      minLines: 1,
      maxLines: 3,
      maxLength: maxLength,
      autofocus: false,
      textAlign: TextAlign.center,
      //cursorColor: ActiveAppTheme.kActivePrimaryThemeColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade700,
        enabledBorder: UnderlineInputBorder(
          //borderSide: BorderSide(color: ActiveAppTheme.kActivePrimaryThemeColor),
        ),
        focusedBorder: UnderlineInputBorder(
          //borderSide: BorderSide(color: ActiveAppTheme.kActivePrimaryThemeColor),
        ),
        border: UnderlineInputBorder(
          //borderSide: BorderSide(color: ActiveAppTheme.kActivePrimaryThemeColor),
        ),
      ),
      onChanged: callback,
    );
  }
}
