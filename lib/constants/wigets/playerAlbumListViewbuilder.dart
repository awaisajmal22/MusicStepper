import 'package:flutter/material.dart';

import '../app_text.dart';

class PlayerAlbumLIstView extends StatefulWidget {
  PlayerAlbumLIstView({
    Key? key,
    required this.height,
    required this.image,
  }) : super(key: key);

  final double height;
  final List<String> image;

  @override
  State<PlayerAlbumLIstView> createState() => _PlayerAlbumLIstViewState();
}

class _PlayerAlbumLIstViewState extends State<PlayerAlbumLIstView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.572,
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: 57,
                    width: MediaQuery.of(context).size.width - 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 57,
                          width: 59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                    index < 3
                                        ? widget.image[0]
                                        : widget.image[1],
                                  ),
                                  fit: BoxFit.cover)),
                          child: Center(
                            child: selectedIndex == index
                                ? Icon(
                                    Icons.graphic_eq_sharp,
                                    color: Color(0xffFFFFFF),
                                  )
                                : Icon(null),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.appText(Alignment.centerLeft, 'Baby',
                                Color(0xffFFFFFF), 12, FontWeight.w700),
                            SizedBox(
                              height: 4,
                            ),
                            AppText.appText(Alignment.centerLeft, 'Justine',
                                Color(0xffFFFFFF), 12, FontWeight.w400),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Icon(
                            selectedIndex == index ? Icons.pause : Icons.play_circle,
                            color: Color(0xffFFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              )),
    );
  }
}
