import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/app_textfeild.dart';
import 'package:app_xyz/constants/elevated_button.dart';
import 'package:app_xyz/constants/text_button.dart';
import 'package:app_xyz/screens/adminandlistner_home_screen.dart';
import 'package:app_xyz/screens/signUp_screen.dart';
import 'package:app_xyz/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCont = TextEditingController();

  final passCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final String appLogo = 'assets/images/applogo.png';
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Container(
          color: Colors.black,
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              AppText.appText(Alignment.center, 'Welcome to MusicStepper',
                  Color(0xffFDD50D), 16, FontWeight.w700),
              Container(
                width: 169,
                height: 135,
                child: Image.asset(appLogo),
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
                      return ('Please Enter Your Email');
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter Valid Email");
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
              SizedBox(height: 20),
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
                  icon: Icon(
                    Icons.lock_outline,
                    color: Color(0xff575758),
                  ),
                  visibility: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  sufIcon: Icon(
                    isObsecure ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffFBFBFB),
                  ),
                  height: height * 0.061,
                  width: 330,
                  radius: 30,
                  labelFont: 16,
                  labelFontWeight: FontWeight.w400,
                  labelColor: Color(0xffFFFFFF).withOpacity(0.7),
                  obsecureText: isObsecure),
              Container(
                  width: 330,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: AppTextButton.textButton('Forgot password?', () {},
                          Color(0xffFFFFFF), 14, FontWeight.w400))),
              SizedBox(
                height: 20,
              ),
              AppElevatedButton.appButton(
                () async {
                  UserModel usersdata = UserModel();
                  String userdocid = "";
                  if (_formKey.currentState!.validate()) {
                    await _auth
                        .signInWithEmailAndPassword(
                            email: emailCont.text, password: passCont.text)
                        .then((uid) {
                      userdocid = uid.user!.uid.toString();
                    }).catchError((e) {
                      Fluttertoast.showToast(msg: e!.message);
                    });
                  }
                  print("\n\n id =>" + userdocid + " \n\n");
                  if (userdocid.isNotEmpty) {
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(userdocid)
                        .get()
                        .then((value) {
                      usersdata = UserModel.fromMap(
                          value.data() as Map<String, dynamic>);
                    });
                    if (usersdata.category == "Admin") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(checkUser: 0)));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(checkUser: 1)));
                    }
                  }
                },
                height * 0.061,
                330,
                'Login',
                Color(0xffFDDF0D),
                Colors.transparent,
                Color(0xff121A2F),
                16,
                FontWeight.w700,
                30,
              ),
              SizedBox(
                height: 10,
              ),
              AppText.appText(Alignment.center, 'Dont have an account?',
                  Color(0xffFFFFFF), 14, FontWeight.w400),
              SizedBox(
                height: 10,
              ),
              AppElevatedButton.appButton(
                () {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
                height * 0.061,
                330,
                'Sign Up',
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
      )),
    );
  }
}
