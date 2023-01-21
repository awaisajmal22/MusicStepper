import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../app_text.dart';

class PurchaseHistoryTabBarView {
  static purchaseHistory() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 16, right: 33.91, top: 12, bottom: 12),
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
                                  'assets/images/player.png',
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
                          AppText.appText(Alignment.centerLeft, 'Cold',
                              Color(0xffFFFFFF), 12, FontWeight.w500),
                          SizedBox(
                            height: 4,
                          ),
                          AppText.appText(Alignment.centerLeft, 'Single',
                              Color(0xffFFFFFF), 12, FontWeight.w500),
                          SizedBox(
                            height: 4,
                          ),
                          AppText.appText(
                              Alignment.centerLeft,
                              'By leavelle',
                              Color(0xffFFFFFF).withOpacity(0.8),
                              10,
                              FontWeight.w400),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.appText(Alignment.centerLeft, '+£ 0.99',
                              Color(0xffFFFFFF), 14, FontWeight.w600),
                          AppText.appText(
                              Alignment.centerLeft,
                              DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              Color(0xffFFFFFF),
                              10,
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
            ));
  }
}
