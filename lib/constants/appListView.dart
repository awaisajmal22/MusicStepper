import 'package:app_xyz/constants/elevated_button.dart';
import 'package:flutter/material.dart';

class AppListView {
  static appListView(BuildContext context) {
    var title = ['Purchase', 'Purchased', 'Done'];
    var buttonColor = [
      Color(0xffFDD50D),
      Color(0xff2B2B32),
      Color(0xff2B2B32),
    ];
    var textandiconColor = [
      Color(0xff000000),
      Color(0xffFFFFFF),
      Color(0xffFFFFFF),
    ];
    var icon = [
      Icons.currency_pound_outlined,
      Icons.timer_outlined,
      Icons.timer_outlined,
    ];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Row(
              children: [
                AppElevatedButton.buttonWithIcon(
                    () {},
                    51,
                    150,
                    title[index],
                    buttonColor[index],
                    Colors.transparent,
                    textandiconColor[index],
                    14,
                    FontWeight.w400,
                    10,
                    Icon(
                      icon[index],
                      color: textandiconColor[index],
                    )),
                SizedBox(
                  width: 16,
                )
              ],
            ));
  }
}
