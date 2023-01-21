import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/elevated_button.dart';
import 'package:app_xyz/constants/profile.dart';
import 'package:app_xyz/constants/wigets/albumTabBarView.dart';
import 'package:app_xyz/constants/wigets/singleTabBarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'adminandlistner_home_screen.dart';

class UploadMusicScreen extends StatefulWidget {
  const UploadMusicScreen({super.key});
  static const routeName = '/UploadScreen';

  @override
  State<UploadMusicScreen> createState() => _UploadMusicScreenState();
}

class _UploadMusicScreenState extends State<UploadMusicScreen>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    TabController _TabController =
        TabController(length: 2, vsync: this, initialIndex: selectedIndex);
    var pages = [SingleTabBarView(), AlbumTabBarView()];
    var title = [
      'Song Title',
      'Featuring',
      'Producer(s)',
      'Genre',
      'Song Writer'
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
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
                        Navigator.of(context)
                            .pushNamed(HomeScreen.routeName);
                      },
                      iconSize: 18),
                  AppText.appText(Alignment.center, 'Upload Music',
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
                      iconSize: 16),
                ],
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              height: 41,
              width: width,
              child: TabBar(
                  labelColor: Color(0xff000000),
                  unselectedLabelColor: Color(0xffFFFFFF),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  controller: _TabController,
                  indicator:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  onTap: (index) {
                    setState(
                      () {
                        selectedIndex = index;
                      },
                    );
                  },
                  tabs: [
                    Tab(
                        child: Container(
                      height: 41,
                      width: 104,
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? Color(0xff0F0F11)
                            : Color(0xffFDD50D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "Single's",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )),
                    )),
                    Tab(
                        child: Container(
                      height: 41,
                      width: 104,
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? Color(0xff0F0F11)
                            : Color(0xffFDD50D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "Album",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )),
                    ))
                  ]),
            ),
            Container(
              height: height - 194,
              width: double.maxFinite,
              child: TabBarView(
                  controller: _TabController, children: [pages[0], pages[1]]),
            )
          ],
        ));
  }
}
