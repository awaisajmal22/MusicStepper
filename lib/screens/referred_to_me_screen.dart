
import 'package:app_xyz/constants/wigets/referredlistView.dart';
import 'package:flutter/material.dart';
import '../constants/app_text.dart';
import '../constants/profile.dart';
class ReferredToMeScreen extends StatelessWidget {
  const ReferredToMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.057,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 190),
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
                      onPressed: () {}, iconSize: 18),
                  AppText.appText(Alignment.center, 'Referred to me',
                      Color(0xffFFFFFF), 14, FontWeight.w500),
              ],
            ),
          ),
          SizedBox(
            height: 37,
          ),
          ReferredListView.referredListView(height)
          
        ],
      ),
    );
  }
}