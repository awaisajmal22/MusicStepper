import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppElevatedButton {
  static appButton(
    Function() onPressed,
    double height,
    double width,
    String title,
    Color color,
    Color borderColor,
    Color textColor,
    double textfont,
    FontWeight fontweight,
    double radius,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(radius)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          onPressed: onPressed,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontSize: textfont,
                    fontWeight: fontweight),
              ))),
    );
  }

  static buttonWithIcon(
      Function() onPressed,
      double height,
      double width,
      String title,
      Color color,
      Color borderColor,
      Color textColor,
      double textfont,
      FontWeight fontweight,
      double radius,
      Icon icon) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(radius)),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          onPressed: onPressed,
          icon: icon,
          label: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontSize: textfont,
                    fontWeight: fontweight),
              ))),
    );
  }
}

class SvgIconButton {
  static svgIconButton({
    required Function() onPressed,
    required double height,
    required double width,
     required String svgIcon,
     required Color color
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: color,
        height: height,
        width: width,
        child: SvgPicture.asset(svgIcon),
      ),
    );
  }
}
