import 'package:app_xyz/constants/elevated_button.dart';
import 'package:app_xyz/constants/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_text.dart';

class PaidStreamOnlyAlert {
  static alertBox(BuildContext context) {
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
                        height: 202,
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
                                  AppText.appText(
                                      Alignment.center,
                                      'MusicSteppr',
                                      Color(0xff000000),
                                      16,
                                      FontWeight.w600),
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
                                      '( Paid Streamers Only)',
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
                              height: 11,
                            ),
                            Icon(
                              FontAwesomeIcons.trophy,
                              size: 42,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 12, right: 12),
                                width: 267,
                                height: 36,
                                child: AppText.appText(
                                    Alignment.center,
                                    'Simply Listen to this artist & be award a Top\n 10 Monthly Listener Award to Earn',
                                    Color(0xffFF4B4B),
                                    12,
                                    FontWeight.w400)),
                          ],
                        ),
                      ),
                    ]),
              ),
            ));
  }
}

class LeaderBoardBalanceAlert {
  static alertBox(BuildContext context) {
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
                        height: 280,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 58,
                                  ),
                                  AppText.appText(
                                      Alignment.center,
                                      'Leaderboard Balance',
                                      Color(0xff000000),
                                      16,
                                      FontWeight.w600),
                                  SizedBox(
                                    width: 26.67,
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
                                  ),
                                  SizedBox(
                                    width: 12,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              height: 18,
                              child: AppText.appText(
                                  Alignment.center,
                                  'Your Leaderboard balance is less than',
                                  Color(0xff000000),
                                  12,
                                  FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 36,
                              child: AppText.appText(Alignment.center, '£ 66',
                                  Color(0xff000000), 24, FontWeight.w600),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 12, right: 12),
                                width: 267,
                                height: 71,
                                child: AppText.appText(
                                    Alignment.center,
                                    'This package allows you to stream all\n streamable music and enter the listening \ncompetitions of artists with a trophy beside \ntheir profile picture.',
                                    Color(0xffFF4B4B),
                                    12,
                                    FontWeight.w400)),
                            SizedBox(
                              height: 16,
                            ),
                            AppElevatedButton.appButton(
                                () => null,
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

class FavouriteArtistAlert {
  static alertBox(BuildContext context,
  {
    required String artist1,
    required String artist2,
     required String artist3,
  }
  ) {
    User? user = FirebaseAuth.instance.currentUser;
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
                              height: 340,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 58,
                                        ),
                                        AppText.appText(
                                            Alignment.center,
                                            "Favourite Artist's",
                                            Color(0xff000000),
                                            16,
                                            FontWeight.w600),
                                        SizedBox(
                                          width: 26.67,
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
                                        ),
                                        SizedBox(
                                          width: 12,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 18,
                                    child: AppText.appText(
                                        Alignment.center,
                                        "My Total Fav Artists Award : ${88}",
                                        Color(0xff000000),
                                        12,
                                        FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 267,
                                    height: 203,
                                    child:  Column(
                                                children: [
                                                  FavArtistContainer(
                                                    artistName: artist1,
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  FavArtistContainer(
                                                    artistName: artist2,
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  FavArtistContainer(
                                                    artistName: artist3,
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                ],
                                              )
                                        
                                  ),
                                  AppElevatedButton.appButton(
                                      () => null,
                                      44,
                                      267,
                                      'Save',
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
                    )
                  ,
            ));
  }

  static Container FavArtistContainer(
  {
    required String artistName,
  }
  ) {
    return Container(
                                                  padding: EdgeInsets.only(
                                                      top: 16,
                                                      left: 12,
                                                      right: 20.22,
                                                      bottom: 16),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Color(0xffEEEEEE),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(10)),
                                                  width: 267,
                                                  height: 53,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AppText.appText(
                                                          Alignment
                                                              .centerLeft,
                                                          artistName,
                                                          Color(0xff0F0F11),
                                                          14,
                                                          FontWeight.w400),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Icon(
                                                          Icons
                                                              .cancel_rounded,
                                                          color: Color(
                                                                  0xff000000)
                                                              .withOpacity(
                                                                  0.6),
                                                          size: 13.33,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
  }
}
