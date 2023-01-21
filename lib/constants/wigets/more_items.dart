import 'package:flutter/material.dart';

import '../app_text.dart';
import '../elevated_button.dart';

class MoreListTile {
  static moreListTile({required String title, required Function() onPressed}) {
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: InkWell(
          onTap: onPressed,
          focusColor: Colors.grey,
          child: ListTile(
            title: AppText.appText(Alignment.centerLeft, title,
                Color(0xffFFFFFF).withOpacity(0.8), 16, FontWeight.w500),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFFFFFF).withOpacity(0.7),
            ),
          ),
        ));
  }
}

class DeleteProfileDailog {
  static deleteProfile(BuildContext context, {required Function() onPressed}) {
    return showDialog(
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
                        height: 208,
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
                                      "Delete Account?",
                                      Color(0xff000000),
                                      16,
                                      FontWeight.w600),
                                  
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              height: 36,
                              child: AppText.appText(
                                  Alignment.center,
                                  "Are you sure You want to Delete your\nAccount?",
                                  Color(0xff000000),
                                  12,
                                  FontWeight.w600),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              AppElevatedButton.appButton(
                                  onPressed,
                                  44,
                                  123,
                                  'Yes',
                                  Color(0xffFF4040),
                                  Colors.transparent,
                                  Color(0xffFFFFFF),
                                  14,
                                  FontWeight.w600,
                                  15),
                                  SizedBox(width: 12,),
                              AppElevatedButton.appButton(() {
                                Navigator.of(context).pop();
                              },
                                  44,
                                  123,
                                  'No',
                                  Color(0xff44A5FF),
                                  Colors.transparent,
                                  Color(0xffFFFFFF),
                                  14,
                                  FontWeight.w600,
                                  15),
                            ])
                          ],
                        ),
                      ),
                    ]),
              ),
            ));
  }
}
