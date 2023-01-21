import 'package:app_xyz/constants/app_text.dart';
import 'package:flutter/material.dart';

class Avatar {
  static circleAvatar(
    double height,
    double width,
    String url,
    String title,
    Color color,
    double fontSize,
    FontWeight fontweight,
    double sizedBoxHeight,
    double marginleft,
    double marginright,
    double contHeight,
  ) {
    return Container(
      margin: EdgeInsets.only(left: marginleft, right: marginright),
      height: contHeight,
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            child: CircleAvatar(
              backgroundImage: AssetImage(url),
            ),
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          AppText.appText(Alignment.center, title, color, fontSize, fontweight)
        ],
      ),
    );
  }

  static profileAvatar(
    double height,
    double width,
    String url,
    String title,
    Color color,
    double fontSize,
    FontWeight fontweight,
    double sizedBoxHeight,
    double marginleft,
    double marginright,
    double contHeight,
  ) {
    return Container(
      margin: EdgeInsets.only(left: marginleft, right: marginright),
      height: contHeight,
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            child: CircleAvatar(
              backgroundImage: NetworkImage(url.toString()),
            ),
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          AppText.appText(Alignment.center, title, color, fontSize, fontweight)
        ],
      ),
    );
  }
}
