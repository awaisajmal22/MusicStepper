import 'package:app_xyz/constants/alertbox_2.dart';
import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/app_textfeild.dart';
import 'package:app_xyz/constants/button_dailog.dart';
import 'package:app_xyz/constants/elevated_button.dart';
import 'package:app_xyz/constants/home.dart';
import 'package:app_xyz/constants/subacribeAlertBox.dart';
import 'package:app_xyz/model/getMusicData.dart';
import 'package:app_xyz/screens/album_screen.dart';
import 'package:app_xyz/screens/history_listenerandadmin_screen.dart';
import 'package:app_xyz/screens/more_screen.dart';
import 'package:app_xyz/screens/profile_screen.dart';
import 'package:app_xyz/screens/single_player_screen.dart';
import 'package:app_xyz/screens/upload_screen.dart';
import 'package:app_xyz/services/firebase_services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants/profile.dart';
import '../constants/wigets/circle_avatar_ListView.dart';

class HomeScreen extends StatefulWidget {
  int checkUser;
  HomeScreen({required this.checkUser, super.key});
  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool firstBuild = true;
  final int selectedindex = 0;
  UserModel user = UserModel();
  final searchCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<GetMusicData>(context, listen: false);
    final loaded = data.items;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Icon(
              Icons.access_time,
              size: 24,
              color: Color(0xff21C34F),
            ),
          ],
        ),
        title: Row(
          children: [
            SizedBox(
              width: 36,
            ),
            Image.asset(
              'assets/images/applogo.png',
              width: 71,
              height: 59.23,
            ),
            SizedBox(
              width: 6,
            ),
            AppText.appText(Alignment.centerLeft, 'MusicSteppr',
                Color(0xffFDD50D), 20, FontWeight.w700),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProfileScreen.routeName,
                  arguments: widget.checkUser
                );
              },
              child: SvgIcon.svgIcon(
                  iconUrl: 'assets/icons/person.svg',
                  height: 26.67,
                  width: 26.67)),
          SizedBox(
            width: 26.67,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              SizedBox(
                height: 24.77,
              ),
              AppTextFeild.textfeild(
                  onSave: null,
                  validator: null,
                  controller: searchCont,
                  label: 'Search Artists, Albums & Singles',
                  icon: Icon(
                    Icons.search,
                    color: Color(0xffFFFFFF),
                  ),
                  visibility: () {},
                  sufIcon: Icon(null),
                  height: 61,
                  width: height - 48,
                  radius: 64,
                  labelFont: 16,
                  labelFontWeight: FontWeight.w400,
                  labelColor: Color(0xffFFFFFF).withOpacity(0.6),
                  obsecureText: false),
              SizedBox(
                height: 40,
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
                          data: loaded,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Musics.seeAllContainer(
                  37, width - 24, "Artist's", "see More", () {}),
              SizedBox(
                height: 18,
              ),
              CircleAvatarListView(width: width),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  AppElevatedButton.appButton(
                    () {
                    },
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
                        size: 14.67,
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  AppElevatedButton.buttonWithIcon(
                      () {},
                      51,
                      150,
                      'Stream Only',
                      Color(0xff2B2B32),
                      Colors.transparent,
                      Color(0xffFFFFFF),
                      14,
                      FontWeight.w500,
                      10,
                      Icon(
                        Icons.timer_outlined,
                        color: Color(0xffFFFFFF),
                        size: 14.67,
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
                          data: loaded,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
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
                        size: 14.67,
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  AppElevatedButton.buttonWithIcon(
                      () {},
                      51,
                      150,
                      'Stream Only',
                      Color(0xff2B2B32),
                      Colors.transparent,
                      Color(0xffFFFFFF),
                      14,
                      FontWeight.w500,
                      10,
                      Icon(
                        Icons.timer_outlined,
                        color: Color(0xffFFFFFF),
                        size: 14.67,
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
                    Musics.seeAllContainer(67, width - 24, "Album's (For Sale)",
                        'See More', () {}),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Musics(
                        onPressed: () {},
                        data: loaded,
                      ),
                    ),
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
                    image: AssetImage(loaded[selectedindex].imgUrl),
                  ),
                  borderRadius: BorderRadius.circular(5)),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.appText(
                    Alignment.topCenter,
                    loaded[selectedindex].title,
                    Color(0xffFFFFFF),
                    13,
                    FontWeight.w400),
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
                onPressed: () {
                  if (data.isPlaying) {
                    data.audioPlayer.pause();
                    setState(() {
                      data.isPlaying = true;
                    });
                  } else {
                    data.initPlayer(loaded[selectedindex].musicUrl);
                    setState(() {
                      data.isPlaying = false;
                    });
                  }
                },
                icon: Icon(
                  data.isPlaying ? Icons.play_arrow : Icons.pause,
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
      floatingActionButton: widget.checkUser == 0
          ? SpeedDial(
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
                  icon: Icon(Icons.settings_outlined),
                  onTap: () {
                    Navigator.of(context).pushNamed(MoreScreen.routeName);
                  },
                ),
                ButtonDailog.buttDailog(
                    icon: Icon(Icons.shopify_outlined),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(HistoryListenerAndAdminScreen.routeName);
                    }),
                ButtonDailog.buttDailog(icon: Icon(Icons.group), onTap: () {}),
                ButtonDailog.buttDailog(
                    icon: Icon(FontAwesomeIcons.trophy),
                    onTap: () {
                      PaidStreamOnlyAlert.alertBox(context);
                    }),
                ButtonDailog.buttDailog(
                    icon: Icon(FontAwesomeIcons.music),
                    onTap: () {
                      Navigator.of(context).pushNamed(AlbumScreen.routeName);
                    }),
                ButtonDailog.buttDailog(
                    icon: Icon(Icons.upload),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(UploadMusicScreen.routeName);
                    })
              ],
            )
          : SpeedDial(
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
