import 'package:app_xyz/constants/alertbox_2.dart';
import 'package:app_xyz/model/getMusicData.dart';
import 'package:app_xyz/model/musicdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constants/app_text.dart';
import '../constants/app_textfeild.dart';
import '../constants/button_dailog.dart';
import '../constants/circleAvatar.dart';
import '../constants/elevated_button.dart';
import '../constants/home.dart';
import '../constants/profile.dart';
import '../constants/wigets/circle_avatar_ListView.dart';

class ProfileListenerScreen extends StatelessWidget {
  static const routeName = '/profileListner';
  const ProfileListenerScreen({super.key, required this.data});
  final List<MusicData> data;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final data = ModalRoute.of(context)!.settings.arguments as Args;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 353,
                  width: width,
                  decoration: BoxDecoration(
                      color: Color(0xffFDD50D),
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 20,
                          left: 20,
                          child: IconButtons.iconButton(
                              iconSize: 27,
                              height: 44,
                              width: 44,
                              containerColor: Colors.black,
                              radius: 30,
                              icon: Icons.arrow_back,
                              iconcolor: Color(0xffFFFFFF),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              borderColor: Colors.transparent,
                              borderWidth: 0)),
                      Positioned(
                          top: 20,
                          right: 20,
                          child: IconButtons.iconButton(
                              onPressed: () {},
                              height: 44,
                              width: 44,
                              containerColor: Colors.black,
                              radius: 30,
                              icon: Icons.more_horiz,
                              iconcolor: Color(0xffFFFFFF),
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              iconSize: 27)),
                      Positioned(
                        top: 65,
                        right: 140,
                        left: 140,
                        child: Avatar.profileAvatar(
                            90,
                            90,
                            data.imageUrl,
                            data.name,
                            Color(0xff121A2F),
                            16,
                            FontWeight.w600,
                            12,
                            0,
                            0,
                            126),
                      ),
                      Positioned(
                          top: 195,
                          left: 162,
                          right: 160,
                          child: AppText.appText(Alignment.center, data.userID,
                              Color(0xff121A2F), 12, FontWeight.w400)),
                      Positioned(
                          top: 225,
                          left: 161,
                          right: 161,
                          child: AppText.appText(
                              Alignment.center,
                              data.description,
                              Color(0xff121A2F),
                              12,
                              FontWeight.w400)),
                      Positioned(
                          bottom: 25,
                          left: 152,
                          right: 152,
                          child: GestureDetector(
                              onTap: () {
                                FavouriteArtistAlert.alertBox(context,
                                artist1: data.artist_1,
                                artist2: data.artist_2,
                                artist3: data.artist_3
                                );
                              },
                              child: Avatar.circleAvatar(
                                  26,
                                  26,
                                  'assets/images/star.png',
                                  "3 Favourite\n Artist's",
                                  Color(0xff000000).withOpacity(0.6),
                                  12,
                                  FontWeight.w400,
                                  8,
                                  0,
                                  0,
                                  68)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 223,
                  width: width - 48,
                  child: Stack(
                    children: [
                      Musics.seeAllContainer(
                          67, width - 24, 'Recently Played', 'See More', () {}),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Musics(
                            onPressed: () {},
                            data: loadedData,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    AppElevatedButton.appButton(
                      () {},
                      51,
                      90,
                      "Single's",
                      Color(0xff0F0F11),
                      Colors.transparent,
                      Color(0xffFFFFFF),
                      14,
                      FontWeight.w500,
                      10,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    AppElevatedButton.buttonWithIcon(
                        () {},
                        51,
                        150,
                        'Purchase',
                        Color(0xffFDD50D),
                        Colors.transparent,
                        Color(0xff000000),
                        14,
                        FontWeight.w500,
                        10,
                        Icon(
                          Icons.currency_pound_outlined,
                          color: Color(0xff000000),
                        ))
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: width - 48,
                  height: 223,
                  child: Stack(
                    children: [
                      Musics.seeAllContainer(67, width - 24,
                          "Single's (For Sale)", 'See More', () {}),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Musics(
                            onPressed: () {},
                            data: loadedData,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    AppElevatedButton.appButton(
                      () {},
                      51,
                      90,
                      "Album's",
                      Color(0xff0F0F11),
                      Colors.transparent,
                      Color(0xffFFFFFF),
                      14,
                      FontWeight.w500,
                      10,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    AppElevatedButton.buttonWithIcon(
                        () {},
                        51,
                        150,
                        'Purchase',
                        Color(0xffFDD50D),
                        Colors.transparent,
                        Color(0xff000000),
                        14,
                        FontWeight.w500,
                        10,
                        Icon(
                          Icons.currency_pound_outlined,
                          color: Color(0xff000000),
                        ))
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 223,
                  width: width - 48,
                  child: Stack(
                    children: [
                      Musics.seeAllContainer(67, width - 24,
                          "Album's (For Sale)", 'See More', () {}),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Musics(
                            onPressed: () {},
                            data: loadedData,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: width - 48,
                  child: Row(
                    children: [
                      AppElevatedButton.appButton(
                          () {},
                          51,
                          150,
                          'Stream Only',
                          Color(0xff0F0F11),
                          Colors.transparent,
                          Color(0xffFFFFFF),
                          14,
                          FontWeight.w500,
                          10),
                      SizedBox(
                        width: 16,
                      ),
                      AppElevatedButton.buttonWithIcon(
                          () {},
                          51,
                          150,
                          'Purchase',
                          Color(0xffFDD50D),
                          Colors.transparent,
                          Color(0xff000000),
                          14,
                          FontWeight.w500,
                          10,
                          Icon(
                            Icons.currency_pound_outlined,
                            color: Color(0xff000000),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 223,
                  width: width - 48,
                  child: Stack(
                    children: [
                      Musics.seeAllContainer(67, width - 24,
                          "Soikot’s Album’s (Stream only)", 'See More', () {}),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Musics(
                            onPressed: () {},
                            data: loadedData,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24, top: 20, bottom: 31),
        width: width,
        height: 98,
        color: Color(0xff1A1A1F),
        child: Row(
          children: [
            Container(
              height: 47,
              width: 47,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/song.png"),
                  ),
                  borderRadius: BorderRadius.circular(5)),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.appText(Alignment.topCenter, 'Monster By Dodie',
                    Color(0xffFFFFFF), 13, FontWeight.w400),
                SizedBox(
                  height: 4,
                ),
                AppText.appText(Alignment.topLeft, 'Single', Color(0xffFFFFFF),
                    13, FontWeight.w400)
              ],
            ),
            SizedBox(
              width: 45,
            ),
            Musics.iconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.replay_10_outlined,
                  size: 21,
                  color: Color(0xffFFFFFF),
                )),
            SizedBox(
              width: 22.39,
            ),
            Musics.iconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  size: 24,
                  color: Color(0xffFFFFFF),
                )),
            SizedBox(
              width: 22.39,
            ),
            Musics.iconButton(
              onPressed: () {},
              icon: Icon(
                Icons.forward_10,
                color: Color(0xffFFFFFF),
                size: 21,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        activeBackgroundColor: Color(0xffFFF1AA),
        spacing: 6,
        spaceBetweenChildren: 16,
        overlayColor: Colors.transparent,
        buttonSize: Size(48, 48),
        overlayOpacity: 0.0,
        child: Icon(
          Icons.more_vert,
          color: Color(0xff000000),
        ),
        backgroundColor: Color(0xffFDD50D),
        closeManually: false,
        visible: true,
        childrenButtonSize: Size(56, 56),
        children: [
          ButtonDailog.buttDailog(
            icon: Icon(Icons.shopify_outlined),
            onTap: () {},
          ),
          ButtonDailog.buttDailog(icon: Icon(Icons.group), onTap: () {}),
        ],
      ),
    );
  }
}
