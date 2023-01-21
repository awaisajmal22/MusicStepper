import 'dart:io';

import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/elevated_button.dart';
import 'package:app_xyz/screens/adminandlistner_home_screen.dart';
import 'package:app_xyz/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants/profile.dart';

class CreateProfileScreen extends StatefulWidget {
  CreateProfileScreen({super.key});
  static const routeName = '/createProfile';

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descriptionCont = TextEditingController();

  TextEditingController artist1Cont = TextEditingController();

  TextEditingController artist2Cont = TextEditingController();

  TextEditingController artist3Cont = TextEditingController();

  TextEditingController nameCont = TextEditingController();

  TextEditingController userNameCont = TextEditingController();
  File? _profileImage;

  Future imagePicked() async {
    final pickedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = pickedImage;
      });
    }
  }

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<FireBaseFunction>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
                    width: width,
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            leading: SizedBox(),
                            // IconButtons.iconButton(
                            //     borderWidth: 0,
                            //     borderColor: Colors.transparent,
                            //     height: 44,
                            //     width: 44,
                            //     containerColor: Color(0xff070E13),
                            //     radius: 30,
                            //     icon: Icons.arrow_back,
                            //     iconcolor: Color(0xffFFFFFF),
                            //     onPressed: () {
                            //       Navigator.of(context).pushNamed(
                            //         HomeScreen.routeName,
                            //       );
                            //     },
                            //     iconSize: 27),
                            title: Text(
                              'Create a profile',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            centerTitle: true,
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: _profileImage != null
                                      ? CircleAvatar(
                                          radius: 50,
                                          backgroundImage: FileImage(
                                            _profileImage!,
                                          ),
                                        )
                                      : CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/profileLogo.png'),
                                        ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: width - 250,
                                child: GestureDetector(
                                  onTap: () {
                                    imagePicked();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffFDDF0D),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 23,
                                      height: 23,
                                      child: Center(
                                          child: Icon(
                                        Icons.edit,
                                        size: 9.45,
                                        color: Colors.black,
                                      ))),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: 330,
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Comment.textFeild(
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Please Enter Your Name';
                                          }
                                        },
                                        onSave: (value) {
                                          nameCont.text = value;
                                        },
                                        height: 60,
                                        width: 330,
                                        label: "Name",
                                        sufIcon: Icon(
                                          Icons.cancel,
                                          size: 13.33,
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.6),
                                        ),
                                        fontsize: 14,
                                        fontweight: FontWeight.w400,
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.7),
                                        controller: nameCont),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Comment.textFeild(
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Please Enter Your User ID';
                                          }
                                          if (!RegExp('@[a-zA-Z0-9.-]+.[a-z]')
                                              .hasMatch(value)) {
                                            return 'Please Enter Valid User ID';
                                          }
                                          return null;
                                        },
                                        onSave: (value) {
                                          userNameCont.text = value;
                                        },
                                        height: 60,
                                        width: 330,
                                        label: "User ID",
                                        sufIcon: Icon(
                                          Icons.cancel,
                                          size: 13.33,
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.6),
                                        ),
                                        fontsize: 14,
                                        fontweight: FontWeight.w400,
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.7),
                                        controller: userNameCont),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    AppText.appText(
                                        Alignment.centerLeft,
                                        'Artist Description',
                                        Color(0xffFFFFFF),
                                        14,
                                        FontWeight.w700),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Comment.textFeild(
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Please Enter Something';
                                          }
                                        },
                                        onSave: (value) {
                                          descriptionCont.text = value;
                                        },
                                        height: 70,
                                        width: 330,
                                        label: 'Describe yourself in ONE WORD',
                                        sufIcon: Icon(
                                          Icons.cancel,
                                          size: 13.33,
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.6),
                                        ),
                                        fontsize: 14,
                                        fontweight: FontWeight.w400,
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.7),
                                        controller: descriptionCont),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    AppText.appText(
                                        Alignment.centerLeft,
                                        "Favourite Artist's",
                                        Color(0xffFFFFFF),
                                        14,
                                        FontWeight.w700),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Comment.textFeild(
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Please Enter your Fav Atrist';
                                          }
                                        },
                                        onSave: (value) {
                                          artist1Cont.text = value;
                                        },
                                        height: 60,
                                        width: 330,
                                        label: "Artist's 1",
                                        sufIcon: Icon(
                                          Icons.cancel,
                                          size: 13.33,
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.6),
                                        ),
                                        fontsize: 14,
                                        fontweight: FontWeight.w400,
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.7),
                                        controller: artist1Cont),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Comment.textFeild(
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Please Enter your Fav Atrist';
                                          }
                                        },
                                        onSave: (value) {
                                          artist2Cont.text = value;
                                        },
                                        height: 60,
                                        width: 330,
                                        label: "Artist's 2",
                                        sufIcon: Icon(
                                          Icons.cancel,
                                          size: 13.33,
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.6),
                                        ),
                                        fontsize: 14,
                                        fontweight: FontWeight.w400,
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.7),
                                        controller: artist2Cont),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Comment.textFeild(
                                        validator: (value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Please Enter your Fav Atrist';
                                          }
                                        },
                                        onSave: (value) {
                                          artist3Cont.text = value;
                                        },
                                        height: 60,
                                        width: 330,
                                        label: "Artist's 3",
                                        sufIcon: Icon(
                                          Icons.cancel,
                                          size: 13.33,
                                          color: Color(0xffFFFFFF)
                                              .withOpacity(0.6),
                                        ),
                                        fontsize: 14,
                                        fontweight: FontWeight.w400,
                                        color:
                                            Color(0xffFFFFFF).withOpacity(0.7),
                                        controller: artist3Cont),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 36, right: 36),
                                        width: 298,
                                        height: 36,
                                        child: AppText.appText(
                                            Alignment.center,
                                            'Choosing a Favourite Artist will contribute to the Artists Earnings if you decide to Stream with us',
                                            Color(0xffFFFFFF),
                                            12,
                                            FontWeight.w400)),
                                    SizedBox(
                                      height: 26,
                                    ),
                                    AppElevatedButton.appButton(
                                      () {
                                        if (_formKey.currentState!.validate()) {
                                          provide.uploadDataToFireStore(
                                              profileImage:
                                                  _profileImage as File,
                                              context: context,
                                              descriptionCont: descriptionCont,
                                              userNameCont: userNameCont,
                                              nameCont: nameCont,
                                              artist1Cont: artist1Cont,
                                              artist2Cont: artist2Cont,
                                              artist3Cont: artist3Cont);
                                        }
                                      },
                                      48,
                                      330,
                                      'Save',
                                      Color(0xffFDD50D),
                                      Colors.transparent,
                                      Color(0xff000000),
                                      14,
                                      FontWeight.w700,
                                      15,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    )
                                  ]),
                            ),
                          ),
                        ]),
                  ),
                
          ),
        ));
  }
}
