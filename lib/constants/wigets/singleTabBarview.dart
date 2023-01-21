import 'dart:io';

import 'package:app_xyz/constants/alertbox_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app_text.dart';
import '../elevated_button.dart';
import '../profile.dart';

class SingleTabBarView extends StatefulWidget {
  const SingleTabBarView({super.key});

  @override
  State<SingleTabBarView> createState() => _SingleTabBarViewState();
}

class _SingleTabBarViewState extends State<SingleTabBarView> {
  int selectedIndex = 0;
  PlatformFile? pickedSong;
  Future songPicked() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    } else {
      setState(() {
        pickedSong = result as PlatformFile?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var buttontitle = ['Yes', 'No'];
    var title = [
      'Song Title',
      'Featuring',
      'Producer(s)',
      'Genre',
      'Song Writer'
    ];
    TextEditingController songTitle = TextEditingController();
    TextEditingController feautring = TextEditingController();
    TextEditingController producer = TextEditingController();
    TextEditingController genre = TextEditingController();
    TextEditingController songWriter = TextEditingController();
    TextEditingController descrip = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(left: 24),
            child: Row(
              children: [
                AppElevatedButton.appButton(
                    () {},
                    41,
                    104,
                    "Purchase",
                    Color(0xff0F0F11),
                    Colors.transparent,
                    Color(0xffFFFFFF),
                    14,
                    FontWeight.w500,
                    10),
                SizedBox(
                  width: 10,
                ),
                AppElevatedButton.appButton(
                    () {},
                    41,
                    160,
                    "Purchase & Stream",
                    Color(0xff0F0F11),
                    Colors.transparent,
                    Color(0xffFFFFFF),
                    14,
                    FontWeight.w500,
                    10),
                SizedBox(
                  width: 10,
                ),
                AppElevatedButton.appButton(
                    () {},
                    41,
                    104,
                    "Stream",
                    Color(0xff0F0F11),
                    Colors.transparent,
                    Color(0xffFFFFFF),
                    14,
                    FontWeight.w500,
                    10),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 121,
                  width: 121,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/snow.png"),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.appText(Alignment.topCenter, 'Upload Artwork',
                        Color(0xffFFFFFF), 16, FontWeight.w600),
                    IconButtons.iconButton(
                      borderWidth: 0,
                      borderColor: Colors.transparent,
                      height: 26.67,
                      width: 26.67,
                      containerColor: Colors.black,
                      radius: 0,
                      icon: Icons.file_upload_outlined,
                      iconcolor: Color(0xffFFFFFF),
                      iconSize: 26.66,
                      onPressed: () {},
                    ),
                    AppElevatedButton.appButton(
                        () => songPicked(),
                        32,
                        130,
                        'Browse',
                        Color(0xffFDD50D),
                        Colors.transparent,
                        Color(0xff000000),
                        14,
                        FontWeight.w400,
                        15)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 66,
          ),
          Container(
            width: 330,
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Comment.textFeild(
                    validator: null,
                    onSave: null,
                    height: 53,
                    width: 330,
                    label: title[0],
                    sufIcon: Icon(
                      Icons.cancel,
                      size: 13.33,
                      color: Color(0xffFFFFFF).withOpacity(0.6),
                    ),
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    color: Color(0xffFFFFFF).withOpacity(0.7),
                    controller: songTitle),
                SizedBox(
                  height: 12,
                ),
                Comment.textFeild(
                    validator: null,
                    onSave: null,
                    height: 53,
                    width: 330,
                    label: title[1],
                    sufIcon: Icon(
                      Icons.cancel,
                      size: 13.33,
                      color: Color(0xffFFFFFF).withOpacity(0.6),
                    ),
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    color: Color(0xffFFFFFF).withOpacity(0.7),
                    controller: feautring),
                SizedBox(
                  height: 12,
                ),
                Comment.textFeild(
                    validator: null,
                    onSave: null,
                    height: 53,
                    width: 330,
                    label: title[2],
                    sufIcon: Icon(
                      Icons.cancel,
                      size: 13.33,
                      color: Color(0xffFFFFFF).withOpacity(0.6),
                    ),
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    color: Color(0xffFFFFFF).withOpacity(0.7),
                    controller: producer),
                SizedBox(
                  height: 12,
                ),
                Comment.textFeild(
                    validator: null,
                    onSave: null,
                    height: 53,
                    width: 330,
                    label: title[3],
                    sufIcon: Icon(
                      Icons.cancel,
                      size: 13.33,
                      color: Color(0xffFFFFFF).withOpacity(0.6),
                    ),
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    color: Color(0xffFFFFFF).withOpacity(0.7),
                    controller: genre),
                SizedBox(
                  height: 12,
                ),
                Comment.textFeild(
                    validator: null,
                    onSave: null,
                    height: 53,
                    width: 330,
                    label: title[4],
                    sufIcon: Icon(
                      Icons.cancel,
                      size: 13.33,
                      color: Color(0xffFFFFFF).withOpacity(0.6),
                    ),
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    color: Color(0xffFFFFFF).withOpacity(0.7),
                    controller: songWriter),
                SizedBox(
                  height: 32,
                ),
                AppText.appText(Alignment.centerLeft, 'Explict',
                    Color(0xffFFFFFF), 14, FontWeight.w400),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: 330,
                  child: Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                          2,
                          (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right: 9,
                                  ),
                                  height: 41,
                                  width: 104,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: selectedIndex == index
                                          ? Color(0xffFDD50D)
                                          : Color(0xff0F0F11)),
                                  child: Center(
                                      child: AppText.appText(
                                          Alignment.center,
                                          buttontitle[index],
                                          selectedIndex == index
                                              ? Color(0xff000000)
                                              : Color(0xffFFFFFF),
                                          14,
                                          FontWeight.w500)),
                                ),
                              ))),
                ),
                SizedBox(
                  height: 28,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 330,
                    child: Column(
                      children: [
                        AppText.appText(Alignment.center, 'Upload Music',
                            Color(0xffFFFFFF), 16, FontWeight.w600),
                        SizedBox(
                          height: 24,
                        ),
                        Icon(
                          FontAwesomeIcons.music,
                          size: 21,
                          color: Color(0xffFFFFFF),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.02,
                ),
                AppElevatedButton.appButton(
                    () => null,
                    44,
                    330,
                    'Browse',
                    Color(0xffFDD50D),
                    Colors.transparent,
                    Color(0xff000000),
                    14,
                    FontWeight.w400,
                    15),
                SizedBox(
                  height: 24,
                ),
                Comment.textFeild(
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter your Fav Atrist';
                      }
                    },
                    onSave: null,
                    height: 129,
                    width: 330,
                    label: 'Single Description',
                    sufIcon: Icon(null),
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    color: Color(0xffFFFFFF).withOpacity(0.7),
                    controller: descrip),
                SizedBox(
                  height: 30,
                ),
                AppElevatedButton.appButton(() {
                }, 48, 330, 'Upload', Color(0xffFDD50D), Colors.transparent,
                    Color(0xff000000), 14, FontWeight.w400, 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
