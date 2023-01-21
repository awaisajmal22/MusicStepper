import 'package:flutter/cupertino.dart';

class MusicData with ChangeNotifier{
  late final String id;
  final String title;
  final String imgUrl;
  final String singerName;
  final String musicUrl;

  MusicData(
      {required this.id,
      required this.title,
      required this.imgUrl,
      required this.singerName,
      required this. musicUrl
      });
}


