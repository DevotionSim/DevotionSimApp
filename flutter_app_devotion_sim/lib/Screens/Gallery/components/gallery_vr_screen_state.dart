import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/Screens/Gallery/components/gallery_chooser_screen_state.dart';
import 'dart:ui' as ui;
import '../gallery_vr_screen.dart';

class GalleryVrState extends State<GalleryVrScreen> {
  //
  late CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'assets/gallery/images/4_1.png',
    'assets/gallery/images/4_1_1.png',
    'assets/gallery/images/4_1_1_1.png',
    'assets/gallery/images/4_2.png',
    'assets/gallery/images/4_3.png',
    'assets/gallery/images/4_4.png',
    'assets/gallery/images/4_5.png',
    'assets/gallery/images/4_6.png',
    'assets/gallery/images/4_7.png',
    'assets/gallery/images/4_8.png',
    'assets/gallery/images/4_9.png',
    'assets/gallery/images/4_10.png',
    'assets/gallery/images/4_11.png',
    'assets/gallery/images/4_12.png',
    'assets/gallery/images/4_13.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    disable();
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            _titulo(),
            carouselSlider = CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                height: 680.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                scrollDirection: Axis.horizontal,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  margin: EdgeInsets.only(top: 120.0, bottom: 50, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(imgList[index], fit: BoxFit.cover),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            onBottom(
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 70),
                      width: 20,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == index ? Colors.redAccent : Colors.white,
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _titulo() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Container(
        child: Text('VR EXPERIENCE',
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
            ))),
    width: double.infinity,
    height: double.infinity,
  );
}

onBottom(Widget child) => Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: child,
      ),
    );

void disable() {
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
}
