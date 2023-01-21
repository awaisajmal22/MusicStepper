import 'package:app_xyz/constants/elevated_button.dart';
import 'package:app_xyz/constants/referredByAlertBox.dart';
import 'package:app_xyz/constants/unsubscribeAlertBox.dart';
import 'package:app_xyz/constants/wigets/history_listener_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/app_text.dart';
import '../constants/profile.dart';

class HistoryListenerAndAdminScreen extends StatelessWidget {
  const HistoryListenerAndAdminScreen({super.key});
  static const routeName = '/historylistneandadmin';
  final int id = 0;

  @override
  Widget build(BuildContext context) {
    final userChecker = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 59,
          ),
          Container(
              margin: EdgeInsets.only(left: 30, right: 24),
              child: userChecker == 0
                  ? Row(
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
                            },
                            iconSize: 27),
                        AppText.appText(Alignment.center, 'History',
                            Color(0xffFFFFFF), 14, FontWeight.w500),
                        AppElevatedButton.appButton(() {
                          ReferredByAlertBox.alertBox(context);
                        },
                            40,
                            92,
                            'Request',
                            Color(0xffFF4040),
                            Colors.transparent,
                            Color(0xffFFFFFF),
                            14,
                            FontWeight.w600,
                            10)
                      ],
                    ) : Row(
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
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/icons/flag.png')),
                        ),
                        Spacer(),
                        AppText.appText(Alignment.center, 'History',
                            Color(0xffFFFFFF), 14, FontWeight.w500),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff44A5FF),
                                borderRadius: BorderRadius.circular(10)),
                            height: 40,
                            width: 36,
                            child: Center(
                                child: AppText.appText(Alignment.center, 'P',
                                    Color(0xffFFFFFF), 14, FontWeight.w600)),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        AppElevatedButton.appButton(
                            () {},
                            40,
                            92,
                            'Request',
                            Color(0xffFF4040),
                            Colors.transparent,
                            Color(0xffFFFFFF),
                            14,
                            FontWeight.w600,
                            10)
                      ],
                    )
                    ),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 19),
              child: id == 0
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.appText(
                                Alignment.centerLeft,
                                'Withdrawal Amount',
                                Color(0xffFFFFFF),
                                14,
                                FontWeight.w600),
                            SizedBox(
                              height: 8,
                            ),
                            AppText.appText(Alignment.centerLeft, '£ 4.99',
                                Color(0xffFFFFFF), 22, FontWeight.w600),
                            SizedBox(
                              height: 17,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText.appText(
                                Alignment.centerLeft,
                                'Leaderboard Balance',
                                Color(0xffFFFFFF),
                                14,
                                FontWeight.w600),
                            SizedBox(
                              height: 8,
                            ),
                            AppText.appText(Alignment.centerLeft, '£ 0.10',
                                Color(0xffFFFFFF), 22, FontWeight.w600),
                            SizedBox(
                              height: 17,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.appText(
                            Alignment.centerLeft,
                            'Withdrawal Amount',
                            Color(0xffFFFFFF),
                            14,
                            FontWeight.w600),
                        SizedBox(
                          height: 8,
                        ),
                        AppText.appText(Alignment.centerLeft, '£ 4.99',
                            Color(0xffFFFFFF), 22, FontWeight.w600),
                        SizedBox(
                          height: 17,
                        ),
                      ],
                    )),
          HistoryListenerTabBar()
        ],
      ),
    );
  }
}
