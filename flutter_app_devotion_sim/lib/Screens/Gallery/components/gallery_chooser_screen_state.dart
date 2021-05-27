import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_devotion_sim/Screens/Gallery/gallery_eventos_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Gallery/gallery_riders_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Gallery/gallery_vr_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Gallery/video_gallery_screen.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import '../gallery_chooser_screen.dart';
import '../gallery_simuladores_screen.dart';

class GalleryChooserScreenState extends State<GalleryChooserScreen> {
  late List<String> titles;
  late List<Widget> images;

  @override
  void initState() {
    super.initState();

    titles = ["Simulators", "Riders", "Events", "VR EXPERIENCE", "Videos"];

    images = [
      Container(
        width: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gallery/images/1.png"),
              fit: BoxFit.cover),
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
      Container(
        width: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gallery/images/2.png"),
              fit: BoxFit.cover),
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
      Container(
        width: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gallery/images/3.png"),
              fit: BoxFit.cover),
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
      Container(
        width: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gallery/images/4.png"),
              fit: BoxFit.cover),
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
      Container(
        width: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gallery/images/5.png"),
              fit: BoxFit.cover),
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: <Widget>[
          _titulo(),
          _slider(titles, images, context),
        ],
      )),
    );
  }
}

Widget _titulo() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    width: double.infinity,
    child: Text('GALLERY',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.redAccent,
        fontFamily: 'MotoGP',
        fontSize: 70,
        shadows: [
          Shadow(
              // bottomLeft
              offset: Offset(-2, -2),
              color: Colors.white),
        ],
      )
    )
  );
}

onBottom(Widget child) => Positioned.fill(
    child: Align(alignment: Alignment.bottomCenter, child: child));

gallerySwitch(int index) {
  switch (index) {
    case 0:
      return GallerySimuladoresScreen();
    case 1:
      return GalleryRidersScreen();
    case 2:
      return GalleryEventosScreen();
    case 3:
      return GalleryVrScreen();
    case 4:
      return VideoGalleryScreen();
    default:
      break;
  }
}

Widget _slider(titles, images, context) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 100),
      child: VerticalCardPager(
        textStyle: TextStyle(
            fontSize: 60,
            fontFamily: 'MotoGP',
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-1.5, -1.5),
                  color: Colors.white),
            ],
            color: Colors.black),
        titles: titles,
        images: images,
        align: ALIGN.CENTER,
        onSelectedItem: (index) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return gallerySwitch(index);
          }));
        },
      ));
}
