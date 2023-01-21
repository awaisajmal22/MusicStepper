import 'package:flutter/material.dart';

import '../app_text.dart';
import '../elevated_button.dart';

class PaidSuccessfullDailog {
  static payment(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              contentPadding: EdgeInsets.all(0),
              content: Container(
                color: Colors.transparent,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 291,
                        height: 179,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffFFFFFF)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 291,
                              height: 44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  color: Color(0xffFDD50D)),
                              child:  AppText.appText(
                                        Alignment.center,
                                        "Paid Successfully",
                                        Color(0xff000000),
                                        16,
                                        FontWeight.w600),
                                    
                            ),
                            Container(
                              height: 36,
                              child: AppText.appText(
                                  Alignment.center,
                                  "Your Leaderboard earning has been paid \nsuccessfully",
                                  Color(0xff000000),
                                  12,
                                  FontWeight.w600),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            AppElevatedButton.appButton(() {
                              Navigator.of(context).pop();
                            },
                                44,
                                267,
                                'Okay',
                                Color(0xffFDD50D),
                                Colors.transparent,
                                Color(0xff000000),
                                14,
                                FontWeight.w600,
                                15)
                          ],
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
