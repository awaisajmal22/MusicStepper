import 'package:flutter/material.dart';

class AppTextButton {
  static textButton(String title, Function onPressed, Color color, double size,
      FontWeight fontWeight) {
    return TextButton(
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
      ),
      onPressed: () => onPressed,
    );
  }
}
