import 'package:app_xyz/constants/appListView.dart';
import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/app_textfeild.dart';
import 'package:app_xyz/constants/circleAvatar.dart';
import 'package:app_xyz/constants/text_button.dart';
import 'package:app_xyz/model/getMusicData.dart';
import 'package:app_xyz/screens/create_profile_screen.dart';
import 'package:app_xyz/screens/edit_profile_info_screen.dart';
import 'package:app_xyz/screens/upload_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants/alertbox_2.dart';
import '../constants/button_dailog.dart';
import '../constants/elevated_button.dart';
import '../constants/home.dart';
import '../constants/profile.dart';
import '../constants/wigets/circle_avatar_ListView.dart';
import '../model/musicdata.dart';
import '../services/firebase_services.dart';
import 'album_screen.dart';
import 'history_listenerandadmin_screen.dart';
import 'more_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });
  static const routeName = '/ProfileScreen';

  User? user = FirebaseAuth.instance.currentUser;
  final searchCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userChecker = ModalRoute.of(context)!.settings.arguments;
    final data = Provider.of<GetMusicData>(context);
    final loaded = data.items;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                var userData = snapshot.data;
                return Container(
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
                                    height: 44,
                                    width: 44,
                                    iconSize: 27,
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
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          EditProfileInfoScreen.routeName);
                                    },
                                    iconSize: 18.07,
                                    height: 44,
                                    width: 44,
                                    containerColor: Colors.black,
                                    radius: 30,
                                    icon: Icons.edit,
                                    iconcolor: Color(0xffFFFFFF),
                                    borderColor: Colors.transparent,
                                    borderWidth: 0)),
                            Positioned(
                              top: 65,
                              right: 140,
                              left: 140,
                              child: Avatar.profileAvatar(
                                  90,
                                  90,
                                  userData != null
                                      ? "${userData['profileImage']}"
                                      : '',
                                  userData != null
                                      ? "${userData['name']} 🎤"
                                      : '',
                                  Color(0xff121A2F),
                                  16,
                                  FontWeight.w600,
                                  12,
                                  24,
                                  24,
                                  126),
                            ),
                            Positioned(
                                top: 195,
                                left: 162,
                                right: 160,
                                child: AppText.appText(
                                    Alignment.center,
                                    userData != null
                                        ? "${userData['userID']}"
                                        : '',
                                    Color(0xff121A2F),
                                    12,
                                    FontWeight.w400)),
                            Positioned(
                                top: 225,
                                left: 161,
                                right: 161,
                                child: AppText.appText(
                                    Alignment.center,
                                    userData != null
                                        ? "${userData['description']}"
                                        : '',
                                    Color(0xff121A2F),
                                    12,
                                    FontWeight.w400)),
                            Positioned(
                                bottom: 25,
                                left: 78,
                                right: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          FavouriteArtistAlert.alertBox(
                                              context,
                                              artist1: userData!['FavArtist1'],
                                              artist2: userData['FavArtist2'],
                                              artist3: userData['FavArtist3']
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
                                            68)),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      color: Color(0xff121A2F),
                                      height: 68,
                                      width: 1,
                                    ),
                                    SizedBox(
                                      width: 47,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context,
                                              HistoryListenerAndAdminScreen
                                                  .routeName,
                                              arguments: userChecker);
                                        },
                                        child: Avatar.circleAvatar(
                                          22.4,
                                          21.6,
                                          'assets/images/wallet.png',
                                          "My Wallet",
                                          Color(0xff000000).withOpacity(0.6),
                                          12,
                                          FontWeight.w400,
                                          8.8,
                                          0,
                                          0,
                                          68,
                                        ))
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        width: width,
                        height: 61,
                        child: Row(
                          children: [
                            AppTextFeild.textfeild(
                              onSave: null,
                              validator: null,
                              controller: searchCont,
                              label: 'search',
                              icon: Icon(
                                Icons.search,
                                color: Color(0xffFFFFFF).withOpacity(0.8),
                              ),
                              visibility: () {},
                              sufIcon: Icon(null),
                              height: 61,
                              width: 350,
                              radius: 64,
                              labelFont: 16,
                              labelFontWeight: FontWeight.w400,
                              labelColor: Color(0xffFFFFFF).withOpacity(0.6),
                              obsecureText: false,
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            IconButtons.iconButton(
                                height: 44,
                                width: 44,
                                iconSize: 24,
                                containerColor: Color(0xff0F0F11),
                                radius: 64,
                                icon: Icons.loop,
                                iconcolor: Color(0xffFFFFFF).withOpacity(0.8),
                                onPressed: () {},
                                borderColor: Color(0xffFBFBFB).withOpacity(0.7),
                                borderWidth: 1)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 31,
                      ),
                      SizedBox(
                        height: 223,
                        width: width - 48,
                        child: Stack(
                          children: [
                            Musics.seeAllContainer(67, width - 24,
                                'Recently Played', 'See More', () {}),
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
                          Container(
                            height: 51,
                            width: 330,
                            child: AppListView.appListView(context),
                          ),
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
                          Container(
                            height: 51,
                            width: 330,
                            child: AppListView.appListView(context),
                          ),
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
                                  data: loaded,
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
                            AppElevatedButton.appButton(
                                () {},
                                51,
                                120,
                                "Album's",
                                Color(0xffFDD50D),
                                Colors.transparent,
                                Color(0xff000000),
                                14,
                                FontWeight.w500,
                                10),
                            SizedBox(
                              width: 16,
                            ),
                            AppElevatedButton.appButton(
                                () {},
                                51,
                                120,
                                "Album's",
                                Color(0xff2B2B32),
                                Colors.transparent,
                                Color(0xffFFFFFF),
                                14,
                                FontWeight.w500,
                                10),
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
                                67,
                                width - 24,
                                "Soikot’s Album’s (Stream only)",
                                'See More',
                                () {}),
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
                        height: 40,
                      )
                    ],
                  ),
                );
              }),
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
      floatingActionButton: userChecker == 0
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
