// import 'package:app_xyz/constants/profile.dart';
// import 'package:app_xyz/constants/wigets/circle_avatar_ListView.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../constants/alertbox_2.dart';
// import '../constants/app_text.dart';
// import '../constants/app_textfeild.dart';
// import '../constants/button_dailog.dart';
// import '../constants/circleAvatar.dart';
// import '../constants/elevated_button.dart';
// import '../constants/home.dart';

// class HomeListnerScreen extends StatelessWidget {
//   const HomeListnerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         leading: Row(
//           children: [
//             SizedBox(
//               width: 24,
//             ),
//             Icon(
//               Icons.access_time,
//               size: 24,
//               color: Color(0xff21C34F),
//             ),
//           ],
//         ),
//         title: Row(
//           children: [
//             SizedBox(
//               width: 36,
//             ),
//             Image.asset(
//               'assets/images/applogo.png',
//               width: 71,
//               height: 59.23,
//             ),
//             SizedBox(
//               width: 6,
//             ),
//             AppText.appText(Alignment.centerLeft, 'MusicSteppr',
//                 Color(0xffFDD50D), 20, FontWeight.w700),
//           ],
//         ),
//         actions: [
//           SvgIcon.svgIcon(
//             iconUrl: 'assets/icons/person.svg', 
//             height: 26.67, 
//             width: 26.67),
//         SizedBox(
//           width: 26.67,
//         )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.only(left: 24, right: 24),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 24.77,
//               ),
//               AppTextFeild.textfeild(
//                   'Search Artists, Albums & Singles',
//                   Icon(
//                     Icons.search,
//                     color: Color(0xffFFFFFF),
//                   ),
//                   Icon(null),
//                   61,
//                   height - 48,
//                   64,
//                   16,
//                   FontWeight.w400,
//                   Color(0xffFFFFFF).withOpacity(0.6)),
//               SizedBox(
//                 height: 40,
//               ),
//               SizedBox(
//                 height: 223,
//                 width: width - 48,
//                 child: Stack(
//                   children: [
//                     Musics.seeAllContainer(
//                         67, width - 24, 'Recently Played', 'See More',(){}),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Musics(
//                         onPressed: () {  },
//                       )
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Musics.seeAllContainer(37, width - 24, "Artist's", "see More",(){}),
//               SizedBox(
//                 height: 18,
//               ),
              
                    
//                     CircleAvatarListView(width: width),
                  
//               SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 children: [
//                   AppElevatedButton.appButton(
//                     () {},
//                     51,
//                     90,
//                     "Single's",
//                     Color(0xff0F0F11),
//                     Colors.transparent,
//                     Color(0xffFFFFFF),
//                     14,
//                     FontWeight.w500,
//                     10,
//                   ),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   AppElevatedButton.buttonWithIcon(
//                       () {},
//                       51,
//                       150,
//                       'Purchase',
//                       Color(0xffFDD50D),
//                       Colors.transparent,
//                       Color(0xff000000),
//                       14,
//                       FontWeight.w500,
//                       10,
//                       Icon(
//                         Icons.currency_pound_outlined,
//                         color: Color(0xff000000),
//                         size: 14.67,
//                       )),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   AppElevatedButton.buttonWithIcon(
//                       () {},
//                       51,
//                       150,
//                       'Stream Only',
//                       Color(0xff2B2B32),
//                       Colors.transparent,
//                       Color(0xffFFFFFF),
//                       14,
//                       FontWeight.w500,
//                       10,
//                       Icon(
//                         Icons.timer_outlined,
//                         color: Color(0xffFFFFFF),
//                         size: 14.67,
//                       ))
//                 ],
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               SizedBox(
//                 width: width - 48,
//                 height: 223,
//                 child: Stack(
//                   children: [
//                     Musics.seeAllContainer(
//                         67, width - 24, "Single's (For Sale)", 'See More',
//                         (){}),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Musics(
//                         onPressed: (){},
//                       )
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 32,
//               ),
//               Row(
//                 children: [
//                   AppElevatedButton.appButton(
//                     () {},
//                     51,
//                     90,
//                     "Album's",
//                     Color(0xff0F0F11),
//                     Colors.transparent,
//                     Color(0xffFFFFFF),
//                     14,
//                     FontWeight.w500,
//                     10,
//                   ),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   AppElevatedButton.buttonWithIcon(
//                       () {},
//                       51,
//                       150,
//                       'Purchase',
//                       Color(0xffFDD50D),
//                       Colors.transparent,
//                       Color(0xff000000),
//                       14,
//                       FontWeight.w500,
//                       10,
//                       Icon(
//                         Icons.currency_pound_outlined,
//                         color: Color(0xff000000),
//                         size: 14.67,
//                       )),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   AppElevatedButton.buttonWithIcon(
//                       () {},
//                       51,
//                       150,
//                       'Stream Only',
//                       Color(0xff2B2B32),
//                       Colors.transparent,
//                       Color(0xffFFFFFF),
//                       14,
//                       FontWeight.w500,
//                       10,
//                       Icon(
//                         Icons.timer_outlined,
//                         color: Color(0xffFFFFFF),
//                         size: 14.67,
//                       ))
//                 ],
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               SizedBox(
//                 height: 223,
//                 width: width - 48,
//                 child: Stack(
//                   children: [
//                     Musics.seeAllContainer(
//                         67, width - 24, "Album's (For Sale)", 'See More',
//                         (){}
//                         ),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Musics(
//                         onPressed: (){},
//                       )
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.only(left: 24, top: 20, bottom: 31),
//         width: width,
//         height: 98,
//         color: Color(0xff1A1A1F),
//         child: Row(
//           children: [
//             Container(
//               height: 47,
//               width: 47,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/song.png"),
//                   ),
//                   borderRadius: BorderRadius.circular(5)),
//             ),
//             SizedBox(
//               width: 8,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText.appText(Alignment.topCenter, 'Monster By Dodie',
//                     Color(0xffFFFFFF), 13, FontWeight.w400),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 AppText.appText(Alignment.topLeft, 'Single', Color(0xffFFFFFF),
//                     13, FontWeight.w400)
//               ],
//             ),
//             SizedBox(
//               width: 45,
//             ),
//             Musics.iconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.replay_10_outlined,
//                   size: 21,
//                   color: Color(0xffFFFFFF),
//                 )),
//             SizedBox(
//               width: 22.39,
//             ),
//             Musics.iconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.play_arrow,
//                   size: 24,
//                   color: Color(0xffFFFFFF),
//                 )),
//             SizedBox(
//               width: 22.39,
//             ),
//             Musics.iconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.forward_10,
//                 color: Color(0xffFFFFFF),
//                 size: 21,
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: SpeedDial(
//         activeBackgroundColor: Color(0xffFFF1AA),
//         spacing: 6,
//         spaceBetweenChildren: 16,
//         overlayColor: Colors.transparent,
//         buttonSize: Size(48, 48),
//         overlayOpacity: 0.0,
//         child: Icon(
//           Icons.more_vert,
//           color: Color(0xff000000),
//         ),
//         backgroundColor: Color(0xffFDD50D),
//         closeManually: false,
//         visible: true,
//         childrenButtonSize: Size(56, 56),
//         children: [
//           ButtonDailog.buttDailog(
//             icon: Icon(Icons.shopify_outlined),
//             onTap: () {},
//           ),
//           ButtonDailog.buttDailog(icon: Icon(Icons.group), onTap: () {}),
          
//         ],
//       ),
//     );
//     ;
//   }
// }
