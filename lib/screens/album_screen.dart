import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constants/app_text.dart';
import '../constants/button_dailog.dart';
import '../constants/home.dart';
import '../constants/profile.dart';
import '../constants/wigets/playerAlbumListViewbuilder.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});
  static const routeName = '/AlbumScreen';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var image = ['assets/images/justin1.png', 'assets/images/justin2.png'];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 57, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtons.iconButton(
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    height: 44,
                    width: 44,
                    containerColor: Color(0xff070E13),
                    radius: 30,
                    icon: Icons.arrow_back,
                    iconcolor: Color(0xffFFFFFF),
                    iconSize: 27,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                AppText.appText(Alignment.center, 'Album', Color(0xffFFFFFF),
                    14, FontWeight.w500),
                IconButtons.iconButton(
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    height: 44,
                    width: 44,
                    containerColor: Color(0xff070E13),
                    radius: 30,
                    icon: Icons.more_horiz,
                    iconcolor: Color(0xffFFFFFF),
                    iconSize: 27,
                    onPressed: () {}),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, bottom: 27),
            height: 96,
            child: Row(
              children: [
                Container(
                  height: 96,
                  width: 129,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/justin1.png'),
                      )),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText.appText(Alignment.center, 'Baby', Color(0xffFFFFFF),
                        16, FontWeight.w700),
                    AppText.appText(Alignment.center, 'By Justine',
                        Color(0xffFFFFFF), 14, FontWeight.w400),
                    AppText.appText(Alignment.center, 'Album',
                        Color(0xffFFFFFF), 14, FontWeight.w400),
                  ],
                ),
                SizedBox(
                  width: 22.17,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffFFFFFF)),
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.shuffle,
                        color: Color(0xffFFFFFF),
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    AppText.appText(Alignment.center, 'Shuffle',
                        Color(0xffFFFFFF), 14, FontWeight.w400)
                  ],
                ),
                PlayerAlbumLIstView(height: height, image: image)
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24, top: 20, bottom: 31),
        width: MediaQuery.of(context).size.width,
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
                Spacer(),
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
    );
  }
}
