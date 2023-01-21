//@dart=2.9
import 'dart:io';

import 'package:app_xyz/model/musicdata.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GetMusicData with ChangeNotifier {
  final List<MusicData> _items = loadedData;
  List<MusicData> get items {
    return [..._items];
  }

  MusicData getById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  AudioCache audioCache;
  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  initPlayer(String path) {
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying = state == AudioPlayerState.PLAYING;
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
      notifyListeners();
    });
    audioPlayer.onAudioPositionChanged.listen((newPostion) {
      position = newPostion;
      notifyListeners();
    });
    playSong(path);
  }

  playSong(String path) async {
    await audioCache.play(path);
    // notifyListeners();
  }

  stopPlaying(String path) async {
    File audioFile = await audioCache.load(path);
    audioPlayer.setUrl(audioFile.path);
    audioPlayer.stop();
    // notifyListeners();
  }

  seekSong(String songUrl) async {
    File audioFile = await audioCache.load(songUrl);
    await audioPlayer.setUrl(audioFile.path);
    notifyListeners();
  }
}

List<MusicData> loadedData = [
  MusicData(
      id: 'a',
      title: 'Thinking Out Loud',
      imgUrl: 'assets/images/x.png',
      singerName: 'By Ed sheeran',
      musicUrl: 'a.mp3'),
  MusicData(
      id: 'b',
      title: 'Runtz / Oh My',
      imgUrl: 'assets/images/y.png',
      singerName: 'By Kwengface',
      musicUrl: 'a.mp3'),
  MusicData(
      id: 'c',
      title: 'Snowcast',
      imgUrl: 'assets/images/snow.png',
      singerName: 'By soikot',
      musicUrl: 'b.mp3'),
  MusicData(
      id: 'd',
      title: 'Hoop Dreams',
      imgUrl: 'assets/images/hoopdreams.png',
      singerName: 'By soikot',
      musicUrl: 'b.mp3'),
  MusicData(
      id: 'e',
      title: 'Contrary',
      imgUrl: 'assets/images/palm1.png',
      singerName: 'By soikot',
      musicUrl: 'b.mp3'),
  MusicData(
      id: 'f',
      title: 'Popular belief',
      imgUrl: 'assets/images/palm2.png',
      singerName: 'By soikot',
      musicUrl: 'a.mp3')
];
