import 'package:app_xyz/screens/profile_listener_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../circleAvatar.dart';

class CircleAvatarListView extends StatelessWidget {
  CircleAvatarListView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firebaseFirestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          var getData = snapshot.data?.docs;
          return getData != null
              ? Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  height: 100,
                  width: width - 24,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getData.length,
                    itemBuilder: (context, index) => index == 0
                        ? Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ProfileListenerScreen.routeName,
                                      arguments: Args(
                                          imageUrl: getData[index]
                                              ['profileImage'],
                                          name: getData[index]['name'],
                                          userID: getData[index]['userID'],
                                          description: getData[index]
                                              ['description'],
                                          artist_1: getData[index]['FavArtist1'],
                                          artist_2: getData[index]['FavArtist2'],
                                          artist_3: getData[index]['FavArtist3']
                                              ));
                                },
                                child: Avatar.profileAvatar(
                                    74,
                                    74,
                                    getData != null
                                        ? getData[index]['profileImage']
                                        : '',
                                    getData != null
                                        ? getData[index]['name']
                                        : '',
                                    Color(0xffFFFFFF),
                                    16,
                                    FontWeight.w400,
                                    4,
                                    0,
                                    23,
                                    100),
                              ),
                              Positioned(
                                right: 25,
                                top: 0,
                                child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffFFFFFF)),
                                    child: Center(
                                        child: Icon(
                                      FontAwesomeIcons.trophy,
                                      color: Color(0xff000000),
                                      size: 10,
                                    ))),
                              )
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ProfileListenerScreen.routeName,
                                  arguments: Args(
                                      imageUrl: getData[index]['profileImage'],
                                      name: getData[index]['name'],
                                      userID: getData[index]['userID'],
                                      description: getData[index]
                                          ['description'],
                                          artist_1: getData[index]['FavArtist1'],
                                          artist_2: getData[index]['FavArtist2'],
                                          artist_3: getData[index]['FavArtist3']
                                          ));
                            },
                            child: Avatar.profileAvatar(
                                74,
                                74,
                                getData[index]['profileImage'],
                                getData[index]['name'],
                                Color(0xffFFFFFF),
                                16,
                                FontWeight.w400,
                                4,
                                0,
                                23,
                                100)),
                  ),
                )
              : CircularProgressIndicator();
        });
  }
}

class Args {
  final String imageUrl;
  final String name;
  final String userID;
  final String description;
  final String artist_1;
  final String artist_2;
  final String artist_3;
  Args(
    {required this.artist_1,
    required this.artist_2
    ,required this.artist_3, 
      required this.imageUrl,
      required this.name,
      required this.userID,
      required this.description});
}
