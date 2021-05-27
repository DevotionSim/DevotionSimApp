import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../video_gallery_screen.dart';
import 'multi_manager/flick_multi_manager.dart';
import 'multi_manager/flick_multi_player.dart';
import 'utils/mock_data.dart';

class VideoGalleryScreenStateState extends State<VideoGalleryScreen> {
  List items = mockData['items'];

  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _titulo(),
        Expanded(
          child: VisibilityDetector(
            key: ObjectKey(flickMultiManager),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction == 0 && this.mounted) {
                flickMultiManager.pause();
              }
            },
            child: Container(
              color: Color.fromARGB(255, 33, 33, 33),
              child: ListView.separated(
                separatorBuilder: (context, int) => Container(
                  height: 50,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 400,
                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FlickMultiPlayer(
                          url: items[index]['trailer_url'],
                          flickMultiManager: flickMultiManager,
                          image: items[index]['image'],
                        ),
                      ));
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

Widget _titulo() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    width: double.infinity,
    child: Text('VIDEOS',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.redAccent,
          fontFamily: 'MotoGP',
          fontSize: 60,
          shadows: [
            Shadow(
                // bottomLeft
                offset: Offset(-1.5, -1.5),
                color: Colors.white),
          ],
        )),
    color: Colors.black,
  );
}
