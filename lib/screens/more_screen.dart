import 'dart:ui';

import 'package:app_xyz/constants/wigets/more_items.dart';
import 'package:app_xyz/constants/wigets/payment_items.dart';
import 'package:app_xyz/screens/login_screen.dart';
import 'package:app_xyz/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_text.dart';
import '../constants/profile.dart';

class MoreScreen extends StatefulWidget {
  MoreScreen({super.key});
  static const routeName = '/moreScreen';

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var title = [
      'Tutorial',
      'Privacy',
      'Terms of use',
      'Contact us',
      'Delete Profile',
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, top: 57, right: 30),
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
                    },
                    iconSize: 18),
                AppText.appText(Alignment.center, 'History', Color(0xffFFFFFF),
                    14, FontWeight.w500),
                SizedBox(
                  width: 44,
                )
              ],
            ),
          ),
          MoreListTile.moreListTile(title: title[0], onPressed: () {}),
          MoreListTile.moreListTile(title: title[1], onPressed: () {}),
          MoreListTile.moreListTile(title: title[2], onPressed: () {}),
          MoreListTile.moreListTile(
              title: title[3],
              onPressed: () {
                PaidSuccessfullDailog.payment(context);
              }),
          MoreListTile.moreListTile(
              title: title[4],
              onPressed: () {
                DeleteProfileDailog.deleteProfile(context, onPressed: () async {
                  deletData();
                  accountSignOut();
                });
              }),
        ],
      ),
    );
  }

  Future accountSignOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/');
  }

  deletData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    await firebaseFirestore.collection('users').doc(user!.uid).delete().then(
        (value) =>
            Fluttertoast.showToast(msg: 'Account is deleted Successfully'));
    User? authUser = FirebaseAuth.instance.currentUser;
    authUser!.delete().then((value) => null);
    
  }
}
