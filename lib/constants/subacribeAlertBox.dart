import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/elevated_button.dart';
import 'package:flutter/material.dart';

class SubScribeAlertBox {
  static alertBox(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
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
                height: 302,
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
                        child: Row(
                          children: [
                            SizedBox(
                              width: 94,
                            ),
                            AppText.appText(Alignment.center, 'MusicSteppr',
                                Color(0xff000000), 16, FontWeight.w600),
                            SizedBox(
                              width: 63.17,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Color(0xff000000),
                                size: 21.67,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText.appText(
                                Alignment.center,
                                'Purchase Monthly Streaming Package',
                                Color(0xff000000),
                                12,
                                FontWeight.w600),
                            SizedBox(
                              width: 4.67,
                            ),
                            Icon(
                              Icons.sensors_rounded,
                              size: 12.67,
                              color: Color(0xff000000),
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.appText(Alignment.center, '£ 4.99',
                              Color(0xff000000), 24, FontWeight.w600),
                          SizedBox(
                            width: 18.25,
                          ),
                          Icon(
                            Icons.access_time,
                            color: Color(0xffFF4040),
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 12, right: 12),
                          width: 267,
                          height: 72,
                          child: AppText.appText(
                              Alignment.center,
                              'This package allows you to stream all \nstreamable music and enter the listening \ncompetitions of artists with a trophy beside\n their profile picture.',
                              Color(0xffFF4B4B),
                              12,
                              FontWeight.w400)),
                      SizedBox(
                        height: 16,
                      ),
                      AppElevatedButton.appButton(
                        () {},
                        44,
                        267,
                        'Subscribe',
                        Color(0xffFDD50D),
                        Colors.transparent,
                        Color(0xff000000),
                        14,
                        FontWeight.w600,
                        15,
                      )
                    ]),
              ),
              SizedBox(
                height: 24,
              ),
              AppElevatedButton.appButton(
                () {},
                44,
                152,
                'Skip For Now',
                Color(0xff979797),
                Colors.transparent,
                Color(0xff000000),
                14,
                FontWeight.w600,
                15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
