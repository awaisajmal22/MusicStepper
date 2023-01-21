//@dart=2.9
import 'dart:io';

import 'package:app_xyz/constants/app_text.dart';
import 'package:app_xyz/constants/circleAvatar.dart';
import 'package:app_xyz/screens/upload_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import '../constants/elevated_button.dart';
import '../constants/profile.dart';
import '../services/firebase_services.dart';

class EditProfileInfoScreen extends StatefulWidget {
  static const routeName = '/EditProfileScreen';

  @override
  State<EditProfileInfoScreen> createState() => _EditProfileInfoScreenState();
}

class _EditProfileInfoScreenState extends State<EditProfileInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  User user = FirebaseAuth.instance.currentUser;

  TextEditingController descriptionCont = TextEditingController();

  TextEditingController Artist1Cont = TextEditingController();

  TextEditingController Artist2Cont = TextEditingController();

  TextEditingController Artist3Cont = TextEditingController();

  File _profileImage;

  Future imagePicked() async {
    final pickedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              var userData = snapshot.data as DocumentSnapshot;
              return Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 58,
                    ),
                    AppText.appText(Alignment.center, 'Edit Profile Info',
                        Color(0xffFFFFFF), 14, FontWeight.w500),
                    SizedBox(
                      height: 24,
                    ),
                    Stack(children: [
                      _profileImage != null
                          ? CircleAvatar(
                              radius: 50, //width of Avatar
                              backgroundImage:
                                  FileImage(_profileImage), // avatar pict
                            )
                          : CircleAvatar(
                              radius: 50, //width of Avatar
                              backgroundImage: NetworkImage(userData != null
                                  ? "${userData['profileImage']}"
                                  : ''), // avatar pict
                            ),
                      Positioned(
                          top: 0,
                          left: 70,
                          child: IconButtons.iconButton(
                              borderWidth: 0,
                              borderColor: Colors.transparent,
                              height: 23,
                              width: 23,
                              containerColor: Color(0xffFDD50D),
                              radius: 50,
                              icon: Icons.edit,
                              iconcolor: Color(0xff000000),
                              iconSize: 9.45,
                              onPressed: () {
                                print(_profileImage);
                                imagePicked();
                              }))
                    ]),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.appText(
                            Alignment.center,
                            userData != null ? "${userData['name']}" : '',
                            Color(0xffFFFFFF),
                            16,
                            FontWeight.w600),
                        SizedBox(
                          width: 10.2,
                        ),
                        Icon(
                          Icons.edit,
                          color: Color(0xffFFFFFF),
                          size: 12.05,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    AppText.appText(
                        Alignment.center,
                        userData != null ? "${userData['userID']}" : '',
                        Color(0xffFFFFFF).withOpacity(0.7),
                        12,
                        FontWeight.w400),
                    SizedBox(
                      height: 8,
                    ),
                    AppText.appText(
                        Alignment.center,
                        userData != null ? "${userData['description']}" : '',
                        Color(0xffFFFFFF),
                        14,
                        FontWeight.w500),
                    SizedBox(
                      height: 41,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        width: 300,
                        child: Column(children: [
                          Row(
                            children: [
                              AppText.appText(
                                  Alignment.centerLeft,
                                  'Artist Description',
                                  Color(0xffFFFFFF),
                                  14,
                                  FontWeight.w700),
                              Spacer(),
                              AppText.appText(
                                  Alignment.centerLeft,
                                  'Describe yourself in One Word',
                                  Color(0xffFFFFFF).withOpacity(0.7),
                                  10,
                                  FontWeight.w400),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Comment.textFeild(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Please Enter Something';
                              }
                            },
                            height: 60,
                            width: 300,
                            label: 'Brilliant!',
                            sufIcon: Icon(
                              Icons.cancel,
                              size: 13.33,
                              color: Color(0xffFFFFFF).withOpacity(0.6),
                            ),
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                            controller: descriptionCont,
                            onSave: (value) {
                              descriptionCont.text = value;
                            },
                          ),
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
                            height: 60,
                            width: 300,
                            label: "Artist's 1",
                            sufIcon: Icon(
                              Icons.cancel,
                              size: 13.33,
                              color: Color(0xffFFFFFF).withOpacity(0.6),
                            ),
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                            color: Color(0xffFFFFFF).withOpacity(0.7),
                            controller: Artist1Cont,
                            onSave: (value) {
                              Artist1Cont.text = value;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Comment.textFeild(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Please Enter your Fav Atrist';
                              }
                            },
                            height: 60,
                            width: 300,
                            label: "Artist's 2",
                            sufIcon: Icon(
                              Icons.cancel,
                              size: 13.33,
                              color: Color(0xffFFFFFF).withOpacity(0.6),
                            ),
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                            color: Color(0xffFFFFFF).withOpacity(0.7),
                            controller: Artist2Cont,
                            onSave: (value) {
                              Artist2Cont.text = value;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Comment.textFeild(
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'Please Enter your Fav Atrist';
                                }
                              },
                              height: 60,
                              width: 300,
                              label: "Artist's 3",
                              sufIcon: Icon(
                                Icons.cancel,
                                size: 13.33,
                                color: Color(0xffFFFFFF).withOpacity(0.6),
                              ),
                              fontsize: 14,
                              fontweight: FontWeight.w400,
                              color: Color(0xffFFFFFF).withOpacity(0.7),
                              controller: Artist3Cont,
                              onSave: (value) {
                                Artist3Cont.text = value;
                              }),
                          SizedBox(
                            height: 22,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 36, right: 36),
                              width: 298,
                              height: 40,
                              child: AppText.appText(
                                  Alignment.center,
                                  'Choosing a Favourite Artist will contribute to the Artists Earnings if you decide to Stream with us',
                                  Color(0xffFFFFFF),
                                  12,
                                  FontWeight.w400)),
                          SizedBox(
                            height: 30,
                          ),
                          AppElevatedButton.appButton(
                            () {
                              updateProfileInfo();
                              Navigator.of(context).pop();
                            },
                            48,
                            300,
                            'Save',
                            Color(0xffFDD50D),
                            Colors.transparent,
                            Color(0xff000000),
                            14,
                            FontWeight.w700,
                            15,
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  updateProfileInfo() async {
    if (_formKey.currentState.validate()) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User user = FirebaseAuth.instance.currentUser;
      UserModel userModel = UserModel();
      userModel.description = descriptionCont.text;
      userModel.favArtist1 = Artist1Cont.text;
      userModel.favArtist2 = Artist2Cont.text;
      userModel.favArtist3 = Artist3Cont.text;

      Reference storage = await FirebaseStorage.instance
        .ref()
        .child('profile/${path.basename(_profileImage.path)}');
    await storage.putFile(File(_profileImage.path));
     String imageurl = await storage.getDownloadURL();
      userModel.profileImage = imageurl;
      await firebaseFirestore.collection('users').doc(user.uid).update({
        'description': userModel.description,
        'FavArtist1': userModel.favArtist1,
        'FavArtist2': userModel.favArtist2,
        'FavArtist3': userModel.favArtist3,
        'profileImage': userModel.profileImage,
      });
      Fluttertoast.showToast(msg: 'Profile Update Successfully');
    }
  }
}
