import 'package:flutter/foundation.dart';

class SongsModel {
  String? uid;
  String? songName;
  String? singerName;
  String? category;
  SongsModel({
    this.uid,
    this.songName,
    this.singerName,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'songName': songName,
      'singerName': singerName,
      'categroy': category
    };
  }
}
