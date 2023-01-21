import 'package:flutter/material.dart';

import 'app_text.dart';
import 'elevated_button.dart';

class ReferredByAlertBox {
  static alertBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        contentPadding: EdgeInsets.all(0),
        content: Container(
          
          color: Colors.transparent,
          child: Container(
            width: 291,
            height: 290,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffFFFFFF)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 12.17),
                    width: 291,
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Color(0xffFDD50D)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        AppText.appText(Alignment.center, 'Reffered By',
                            Color(0xff000000), 16, FontWeight.w600),
                        SizedBox(
                          width: 68,
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Icon(
                            Icons.cancel,
                            color: Color(0xff000000),
                            size: 21.67,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Work there
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 63,
                        width: 59,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/song.png'),
                            fit: BoxFit.cover
                          )
                        ),

                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.appText(
                            Alignment.centerLeft, 
                            'Cold', 
                            Color(0xff000000), 
                            12, FontWeight.w500),
                            SizedBox(height: 4,),
                            AppText.appText(
                            Alignment.topLeft, 
                            'Single', 
                            Color(0xff000000), 
                            12, FontWeight.w500),
                            const SizedBox(
                              height: 4,
                            ),
                            AppText.appText(
                            Alignment.bottomLeft, 
                            'By leavelle', 
                            Color(0xff000000).withOpacity(0.8), 
                            10, FontWeight.w400)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                   padding: EdgeInsets.only(top:17, left: 16, bottom: 18),
                   decoration: BoxDecoration(
                        color: Color(0xffEEEEEE),
                         borderRadius:
                           BorderRadius.circular(10)),
                              width: 267,
                              height: 53,
                              child: AppText.appText(
                                Alignment.centerLeft, 'Referred By', Color(0xff000000).withOpacity(0.8), 12, FontWeight.w500),
                                              
                  ),
                  SizedBox(
                    height: 2,
                  ),
                 Container( 
                  child: AppText.appText(
                                Alignment.center,
                               '£ 0.99',
                               Color(0xff000000), 24, FontWeight.w600),),
                               SizedBox(
                                height: 16,
                               ),
                  AppElevatedButton.appButton(
                    () {},
                    44,
                    267,
                    'Buy Now',
                    Color(0xffFDD50D),
                    Colors.transparent,
                    Color(0xff000000),
                    14,
                    FontWeight.w600,
                    15,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
