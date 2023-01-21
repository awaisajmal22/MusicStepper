//@dart=2.9
import 'dart:io';

import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/elevated_button.dart';
import 'package:app_xyz/constants/home.dart';
import 'package:app_xyz/constants/profile.dart';
import 'package:app_xyz/model/getMusicData.dart';
import 'package:app_xyz/model/musicdata.dart';
import 'package:app_xyz/screens/adminandlistner_home_screen.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/web/audioplayers_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SingleMusicPlayerScreen extends StatefulWidget {
  static const routeName = '/PlayerScreen';
  final String title;
  final String singerName;
  final String songUrl;
  final String imageUrl;
  const SingleMusicPlayerScreen(
      {@required this.title,
      @required this.singerName,
      @required this.songUrl,
      @required this.imageUrl});
  @override
  State<SingleMusicPlayerScreen> createState() =>
      _SingleMusicPlayerScreenState();
}

class _SingleMusicPlayerScreenState extends State<SingleMusicPlayerScreen> {
  // bool isPlaying = false;

  GetMusicData getDataFromProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromProvider = Provider.of<GetMusicData>(context, listen: false);
    getDataFromProvider.initPlayer(widget.songUrl);
  }
void playMusic(){
  if (getDataFromProvider.isPlaying) {
                        getDataFromProvider.audioPlayer.pause();
                        setState(() {
                          getDataFromProvider.isPlaying = true;
                        });
                      } else {
                        getDataFromProvider.playSong(widget.songUrl);
                        setState(() {
                          getDataFromProvider.isPlaying = false;
                        });
                      }
}
  @override
  void dispose() {
    super.dispose();
    getDataFromProvider.stopPlaying(widget.songUrl);
    // getDataFromProvider.audioPlayer.stop();

    // getDataFromProvider.removeListener(getDataFromProvider.audioPlayer.);
    // getDataFromProvider.removeListener(() {c})
    // getDataFromProvider.dispose();
  }

  String formatTime(Duration d) {
    if (d == null) return "-:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var icon = [
      Icon(
        Icons.person,
        size: 18,
      ),
      Icon(
        Icons.group_outlined,
        size: 18,
      ),
      Icon(
        Icons.access_time,
        color: Color(0xff21C345),
        size: 18,
      ),
      Icon(
        Icons.more_vert,
        size: 18,
      )
    ];
    // final getDataFromProvider = Provider.of<GetMusicData>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: 57,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
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
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          getDataFromProvider.stopPlaying(widget.songUrl);
                        });
                      },
                      iconSize: 27),
                  AppText.appText(Alignment.center, 'Music Player',
                      Color(0xffFFFFFF), 14, FontWeight.w500),
                  IconButtons.iconButton(
                      borderWidth: 0,
                      borderColor: Colors.transparent,
                      height: 44,
                      width: 44,
                      containerColor: Color(0xff070E13),
                      radius: 30,
                      icon: Icons.more_horiz,
                      iconcolor: Color(0xffFFFFFF),
                      onPressed: () {},
                      iconSize: 27),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 321,
              width: 281,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(widget.imageUrl))),
            ),
            SizedBox(
              height: 24,
            ),
            AppText.appText(Alignment.center, widget.title, Color(0xffFFFFFF),
                16, FontWeight.w700),
            SizedBox(
              height: 4,
            ),
            AppText.appText(Alignment.center, widget.singerName,
                Color(0xffFFFFFF).withOpacity(0.5), 14, FontWeight.w400),
            SizedBox(
              height: 4,
            ),
            AppText.appText(Alignment.center, 'Single',
                Color(0xffFFFFFF).withOpacity(0.5), 14, FontWeight.w400),
            SizedBox(
              height: 24,
            ),
            Wrap(
              children: List.generate(
                  4,
                  (index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Color(0xffFDD50D)
                                : Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(right: 12),
                        child: Center(
                          child: icon[index],
                        ),
                      ))),
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              height: 12,
              margin: EdgeInsets.only(left: 55, right: 55),
              child: Slider(
                min: 0.0,
                max: getDataFromProvider.duration.inSeconds.toDouble(),
                value: getDataFromProvider.position.inSeconds.toDouble(),
                onChanged: (double value) async {
                  setState(() {
                    getDataFromProvider.seekSong(widget.songUrl);
                  });
                },
                activeColor: Color(0xffFFFFFF),
                inactiveColor: Color(0xffFFFFFF).withOpacity(0.2),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              margin: EdgeInsets.only(left: 80, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.appText(
                      Alignment.center,
                      formatTime(getDataFromProvider.position),
                      Color(0xffFFFFFF).withOpacity(0.5),
                      14,
                      FontWeight.w400),
                  AppText.appText(
                      Alignment.center,
                      formatTime((getDataFromProvider.duration - getDataFromProvider.position)),
                      Color(0xffFFFFFF).withOpacity(0.5),
                      14,
                      FontWeight.w400),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              margin: EdgeInsets.only(left: 60, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButtons.iconButton(
                      onPressed: () {
                        getDataFromProvider.audioPlayer
                            .seek(getDataFromProvider.position - Duration(seconds: 15));
                        if (getDataFromProvider.position <= Duration(seconds: 15)) {
                          getDataFromProvider.audioPlayer
                              .seek(getDataFromProvider.position = Duration(seconds: 0));
                        }
                      },
                      height: 22,
                      width: 21.74,
                      icon: Icons.replay_sharp,
                      iconcolor: Color(0xffFFFFFF),
                      containerColor: Colors.transparent,
                      radius: 0,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      iconSize: 22),
                  SizedBox(
                    width: 28.26,
                  ),
                  IconButtons.iconButton(
                      onPressed: () {
                        setState(() {
                          // _audioPlayer.onSeekComplete;
                        });
                      },
                      height: 22,
                      width: 21.74,
                      icon: FontAwesomeIcons.stepBackward,
                      iconcolor: Color(0xffFFFFFF),
                      containerColor: Colors.transparent,
                      radius: 0,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      iconSize: 27),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: playMusic,
                    child: Container(
                      height: 90,
                      width: 90,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          getDataFromProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Color(0xff000000),
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButtons.iconButton(
                      onPressed: () {},
                      height: 22,
                      width: 21.74,
                      icon: FontAwesomeIcons.stepForward,
                      iconcolor: Color(0xffFFFFFF),
                      containerColor: Colors.transparent,
                      radius: 0,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      iconSize: 27),
                  SizedBox(
                    width: 28.26,
                  ),
                  IconButtons.iconButton(
                      onPressed: () {
                        if (getDataFromProvider.position + Duration(seconds: 15) <
                            getDataFromProvider.duration) {
                          getDataFromProvider.audioPlayer
                              .seek(getDataFromProvider.position + Duration(seconds: 15));
                        } else {
                          getDataFromProvider.position =
                              getDataFromProvider.position - getDataFromProvider.position;
                          getDataFromProvider.audioPlayer.seek(getDataFromProvider.position);
                          getDataFromProvider.audioPlayer.stop();
                        }
                      },
                      height: 22,
                      width: 21.74,
                      icon: Icons.refresh_sharp,
                      iconcolor: Color(0xffFFFFFF),
                      containerColor: Colors.transparent,
                      radius: 0,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      iconSize: 22),
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
