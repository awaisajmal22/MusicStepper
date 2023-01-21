import 'package:app_xyz/model/musicdata.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../model/getMusicData.dart';
import '../screens/player_screen.dart';
import '../screens/single_player_screen.dart';
import 'app_text.dart';

class Musics extends StatefulWidget {
  final Function() onPressed;
  final List<MusicData> data;
  const Musics({
    super.key,
    required this.onPressed,
    required this.data,
  });

  @override
  State<Musics> createState() => _MusicsState();

  static seeAllContainer(double height, double width, String title,
      String seeAll, Function() onPressed) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 8),
      decoration: BoxDecoration(
          color: Color(0xff0F0F11),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.appText(
              Alignment.topLeft, title, Color(0xffFFFFFF), 14, FontWeight.w500),
          InkWell(
              focusColor: Colors.grey,
              onTap: onPressed,
              child: AppText.appText(Alignment.topRight, seeAll,
                  Color(0xffFFFFFF).withOpacity(0.7), 14, FontWeight.w500))
        ],
      ),
    );
  }

  static iconButton({
    required Function() onPressed,
    required Icon icon,
  }) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}

class _MusicsState extends State<Musics> {
  int selectedIndex = 0;
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // var title = [
    //   'Thinking Out Loud',
    //   'Runtz / Oh My',
    //   'Snowcast',
    //   'Hoop Dreams',
    //   'Contrary',
    //   'Popular belief'
    // ];
    // var url = [
    //   'assets/images/x.png',
    //   'assets/images/y.png',
    //   'assets/images/snow.png',
    //   'assets/images/hoopdreams.png',
    //   'assets/images/album.png',
    //   'assets/images/black.png',
    // ];
    // var subtitle = [
    //   'By Ed Sheeran',
    //   'By Kwengface',
    //   'By Soikot',
    //   'By Soikot',
    //   'By Soikot',
    //   'By Soikot',
    // ];
    return Container(
      height: 176,
      width: width - 48,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              PlayerScreen.routeName,
              arguments: widget.data[index].id,
            );
            setState(() {
              widget.data.insert(selectedIndex, widget.data.removeAt(index));
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Color(0xff0F0F11),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 176,
            width: 200,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 119,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(widget.data[index].imgUrl),
                          fit: BoxFit.fitWidth)),
                ),
                SizedBox(height: 8),
                Padding(
                    padding: EdgeInsets.only(left: 12, right: 28),
                    child: AppText.appText(
                        Alignment.centerLeft,
                        widget.data[index].title,
                        Color(0xffFFFFFF).withOpacity(0.8),
                        14,
                        FontWeight.w400)),
                SizedBox(
                  height: 1,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 12, right: 28),
                    child: AppText.appText(
                        Alignment.centerLeft,
                        widget.data[index].singerName,
                        Color(0xffFFFFFF).withOpacity(0.5),
                        10,
                        FontWeight.w400))
              ],
            ),
          ),
        ),
      ),
    );

    
  }

  
}
