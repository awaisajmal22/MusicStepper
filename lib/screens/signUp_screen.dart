import 'package:app_xyz/constants/subacribeAlertBox.dart';
import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/app_textfeild.dart';
import 'package:app_xyz/screens/adminandlistner_home_screen.dart';
import 'package:app_xyz/screens/create_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/elevated_button.dart';
import '../services/firebase_services.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  final emailCont = TextEditingController();

  final passCont = TextEditingController();

  final repassCont = TextEditingController();

  final referredbyCont = TextEditingController();

  final categoryCont = TextEditingController();
  bool isObsecure = true;
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: _formkey,
          child: Container(
            color: Colors.black,
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 119,
                  width: 149,
                  child: Image.asset('assets/images/applogo.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextFeild.textfeild(
                    onSave: (value) {
                      emailCont.text = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return "Please Enter Valid Email";
                      }
                      return null;
                    },
                    controller: emailCont,
                    label: 'Email Address',
                    icon: Icon(
                      Icons.email_outlined,
                      color: Color(0xff575758),
                    ),
                    visibility: () {},
                    sufIcon: Icon(null),
                    height: height * 0.061,
                    width: 330,
                    radius: 30,
                    labelFont: 16,
                    labelFontWeight: FontWeight.w400,
                    labelColor: Color(0xffFFFFFF).withOpacity(0.7),
                    obsecureText: false),
                SizedBox(
                  height: 20,
                ),
                AppTextFeild.textfeild(
                    onSave: (value) {
                      passCont.text = value;
                    },
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');

                      if (value.isEmpty) {
                        return ('Password is required for Login');
                      }
                      if (!regex.hasMatch(value)) {
                        return ('Please Enter Valid Password');
                      }
                    },
                    controller: passCont,
                    label: 'Password',
                    icon: Icon(Icons.lock_outline, color: Color(0xff575758)),
                    visibility: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    sufIcon: Icon(Icons.remove_red_eye,
                        color: Color(0xffFFFFFF).withOpacity(0.7)),
                    height: height * 0.061,
                    width: 330,
                    radius: 30,
                    labelFont: 16,
                    labelFontWeight: FontWeight.w400,
                    labelColor: Color(0xffFFFFFF).withOpacity(0.7),
                    obsecureText: true),
                SizedBox(
                  height: 20,
                ),
                AppTextFeild.textfeild(
                    onSave: (value) {
                      passCont.text = value;
                    },
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');

                      if (value.isEmpty) {
                        return ('Password is required for Login');
                      }
                      if (!regex.hasMatch(value)) {
                        return ('Please Enter Valid Password');
                      }
                    },
                    controller: repassCont,
                    label: 'Re-enter Password',
                    icon: Icon(Icons.lock_outline, color: Color(0xff575758)),
                    visibility: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    sufIcon: Icon(Icons.remove_red_eye,
                        color: Color(0xffFFFFFF).withOpacity(0.7)),
                    height: height * 0.061,
                    width: 330,
                    radius: 30,
                    labelFont: 16,
                    labelFontWeight: FontWeight.w400,
                    labelColor: Color(0xffFFFFFF).withOpacity(0.7),
                    obsecureText: true),
                SizedBox(height: 20),
                AppTextFeild.textfeild(
                    onSave: (value) {
                      referredbyCont.text = value;
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter Something';
                      }
                    },
                    controller: referredbyCont,
                    label: 'Referred By',
                    icon: Icon(Icons.group_rounded, color: Color(0xff575758)),
                    visibility: () {},
                    sufIcon: Icon(null),
                    height: height * 0.061,
                    width: 330,
                    radius: 30,
                    labelFont: 16,
                    labelFontWeight: FontWeight.w400,
                    labelColor: Color(0xffFFFFFF).withOpacity(0.7),
                    obsecureText: false),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 330,
                  height: 30,
                  child: AppText.appText(
                      Alignment.centerLeft,
                      'Choose a friend who told you about this platform. They will earn every time you make a sale and every time you buy',
                      Color(0xffFFFFFF),
                      10,
                      FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                AppTextFeild.dropDownTextFeild(
                    onSave: (value) {
                      categoryCont.text = value;
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter Something';
                      }
                    },
                    controller: categoryCont,
                    label: [
                      'Admin',
                      'Listner',
                    ],
                    icon: Icon(
                      Icons.music_note,
                      color: Color(0xff575758),
                    ),
                    visibility: () {},
                    sufIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xffFFFFFF).withOpacity(0.7),
                    ),
                    height: height * 0.061,
                    width: 330,
                    radius: 30,
                    labelFont: 16,
                    labelFontWeight: FontWeight.w400,
                    labelColor: Color(0xffFFFFFF).withOpacity(0.7),
                    obsecureText: false,
                    hintText: 'Select Category'),
                SizedBox(
                  height: 20,
                ),
                AppElevatedButton.appButton(
                  () {
                    signup(emailCont.text, passCont.text);
                  },
                  height * 0.061,
                  330,
                  'Sign Up',
                  Color(0xffFDDF0D),
                  Colors.transparent,
                  Color(0xff121A2F),
                  16,
                  FontWeight.w700,
                  30,
                ),
                SizedBox(
                  height: 20,
                ),
                AppElevatedButton.appButton(
                  () {
                    SubScribeAlertBox.alertBox(context);
                  },
                  height * 0.061,
                  330,
                  'Tutorial',
                  Colors.transparent,
                  Color(0xffFDDF0D),
                  Color(0xffFDDF0D),
                  16,
                  FontWeight.w700,
                  30,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void signup(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                signUpToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  signUpToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.password = passCont.text;
    userModel.referredBy = referredbyCont.text;
    userModel.category = categoryCont.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully :");
    Navigator.pushReplacementNamed(context, CreateProfileScreen.routeName);
  }
}
