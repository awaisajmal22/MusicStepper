import 'package:app_xyz/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'earnedHistoryListView.dart';
import 'purchaseHistoryListView.dart';

class HistoryAdminTabBar extends StatefulWidget {
  const HistoryAdminTabBar({super.key});

  @override
  State<HistoryAdminTabBar> createState() => _HistoryAdminTabBarState();
}

class _HistoryAdminTabBarState extends State<HistoryAdminTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            height: 44,
            decoration: BoxDecoration(
                color: Color(0xff0F0F11),
                borderRadius: BorderRadius.circular(15)),
            child: TabBar(
                labelColor: Color(0xff000000),
                unselectedLabelColor: Color(0xffFFFFFF),
                indicatorColor: Color(0xffFDD50D),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffFDD50D)),
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      'Purchased',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Earned',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  )
                ])),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          height: MediaQuery.of(context).size.height * 0.725,
          child: TabBarView(controller: _tabController, children: [
            Container(
              child: Center(
                child: AppText.appText(Alignment.center, 'No purchased Record ', Color(0xffFFFFFF), 14, FontWeight.w600),
              ),
            ),
            Container(
              child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 16, right: 12, top: 12, bottom: 12),
                  height: 87,
                  decoration: BoxDecoration(
                      color: Color(0xff0F0F11),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 63,
                        width: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/timer.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          AppText.appText(Alignment.centerLeft, 'Sign Up Award',
                              Color(0xffFFFFFF), 12, FontWeight.w500),
                          SizedBox(
                            height: 4,
                          ),
                          AppText.appText(Alignment.centerLeft, 'You signed up Topsy',
                              Color(0xffFFFFFF), 12, FontWeight.w400),
                          SizedBox(
                            height: 4,
                          ),
                          AppText.appText(
                              Alignment.centerLeft,
                              'Topsy Activated monthly...',
                              Color(0xffFFFFFF).withOpacity(0.8),
                              10,
                              FontWeight.w400),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.appText(Alignment.centerLeft, '+£ 0.20',
                              Color(0xffFFFFFF), 14, FontWeight.w600),
                          AppText.appText(
                              Alignment.centerLeft,
                              DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              Color(0xffFFFFFF),
                              12,
                              FontWeight.w400),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ))
                ),
          ]),
        )
      ],
    );
  }
}
