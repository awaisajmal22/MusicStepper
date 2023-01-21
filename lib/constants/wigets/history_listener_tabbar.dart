import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/wigets/earnedHistoryListView.dart';
import 'package:app_xyz/constants/wigets/purchaseHistoryListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HistoryListenerTabBar extends StatefulWidget {
  const HistoryListenerTabBar({super.key});

  @override
  State<HistoryListenerTabBar> createState() => _HistoryListenerTabBarState();
}

class _HistoryListenerTabBarState extends State<HistoryListenerTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TabController _tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          height: 44,
          decoration: BoxDecoration(
            color: Color(0xff0F0F11),
            borderRadius: BorderRadius.circular(15)
          ),
          child: TabBar(
            labelColor: Color(0xff000000),
            unselectedLabelColor: Color(0xffFFFFFF),
            indicatorColor: Color(0xffFDD50D),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffFDD50D)
            ),
            controller: _tabController,
            tabs: [
              Tab(
                child: Text('Purchased', style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),),
                ),
              Tab(
                child: Text('Earned', style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),),
              )
          ]
          )
        ),
        Container(
          margin: EdgeInsets.only(left: 32, right: 16),
          height: MediaQuery.of(context).size.height * 0.725,
          child: TabBarView(
            controller: _tabController,
            children: [
            PurchaseHistoryTabBarView.purchaseHistory(),
            EarnedHistoryTabBarView.earnedHistory()
          ]),
        )
      ],
    );
  }
}
