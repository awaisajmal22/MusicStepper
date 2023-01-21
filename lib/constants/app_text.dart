import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppText {
  static appText(
    Alignment alignment,
    String title,
    Color? colors,
    double? fontSize,
    FontWeight? fontWeight,
  ) {
    return Align(
      alignment: alignment,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colors,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
