import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;

class UserModel {
  String? uid;
  String? name;
  String? userId;
  String? email;
  String? password;
  String? repassword;
  String? referredBy;
  String? category;
  String? profileImage;
  String? description;
  String? favArtist1;
  String? favArtist2;
  String? favArtist3;
  UserModel(
      {this.uid,
      this.email,
      this.name,
      this.userId,
      this.password,
      this.repassword,
      this.referredBy,
      this.category,
      this.profileImage,
      this.description,
      this.favArtist1,
      this.favArtist2,
      this.favArtist3,
      });

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        userId: map['userID'],
        password: map['password'],
        repassword: map['repassword'],
        referredBy: map['referred By'],
        category: map['category'],
        description: map['description'],
        profileImage: map['profileImage'],
        favArtist1: map['FavArtist1'],
        favArtist2: map['FavArtist2'],
        favArtist3: map['FavArtist3']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'userID': userId,
      'password': password,
      'repassword': repassword,
      'referred By': referredBy,
      'category': category,
      'description': description,
      'profileImage': profileImage,
      'FavArtist1': favArtist1,
      'FavArtist2': favArtist2,
      'FavArtist3': favArtist3
    };
  }
}

class FireBaseFunction with ChangeNotifier {
  uploadDataToFireStore({
    required context,
    required TextEditingController descriptionCont,
    required TextEditingController userNameCont,
    required TextEditingController nameCont,
    required TextEditingController artist1Cont,
    required File profileImage,
    required TextEditingController artist2Cont,
    required TextEditingController artist3Cont,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();
    
    userModel.description = descriptionCont.text;
    userModel.name = nameCont.text;
    userModel.userId = userNameCont.text;
    userModel.favArtist1 = artist1Cont.text;
    userModel.favArtist2 = artist2Cont.text;
    userModel.favArtist3 = artist3Cont.text;
 Reference storage = await FirebaseStorage.instance
        .ref()
        .child('profile/${path.basename(profileImage.path)}');
    await storage.putFile(File(profileImage.path));
    String imageurl = await storage.getDownloadURL();
    userModel.profileImage = imageurl;
    await firebaseFirestore.collection('users').doc(user!.uid).update({
      'description': userModel.description,
      'name': userModel.name,
      'userID': userModel.userId,
      'FavArtist1': userModel.favArtist1,
      'FavArtist2': userModel.favArtist2,
      'FavArtist3': userModel.favArtist3,
      'profileImage': userModel.profileImage
    });
    Fluttertoast.showToast(msg: "Profile Created Successfully :");
    Navigator.of(context).pop();
  }
}
