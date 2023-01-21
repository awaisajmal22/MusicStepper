import 'package:app_xyz/model/musicdata.dart';
import 'package:app_xyz/screens/album_screen.dart';
import 'package:app_xyz/screens/single_player_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../model/getMusicData.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({
    super.key,
  });
  static const routeName = '/PlayerScreen';
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments;
    final getData = Provider.of<GetMusicData>(context).getById(data.toString());
    var pages = [
      SingleMusicPlayerScreen(
        title: getData.title,
        imageUrl: getData.imgUrl,
        songUrl: getData.musicUrl,
        singerName: getData.singerName,
      ),
      AlbumScreen()
    ];
    return PageView(
      controller: _pageController,
      allowImplicitScrolling: true,
      scrollDirection: Axis.vertical,
      children: [pages[0], pages[1]],
    );
  }
}
