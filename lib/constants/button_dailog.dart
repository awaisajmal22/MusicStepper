import 'package:app_xyz/constants/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ButtonDailog {
  static buttDailog(
    {required Icon icon,
    required Function() onTap
    }
  ) {
    return SpeedDialChild(
    backgroundColor: Color(0xffFFFFFF),
    child: icon,
    onTap: onTap

      );
  }
}
