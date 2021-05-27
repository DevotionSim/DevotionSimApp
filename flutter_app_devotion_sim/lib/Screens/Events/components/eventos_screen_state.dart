import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import '../eventos_screen.dart';

class EventosScreenState extends State<EventosScreen> {
  List imgList = [
    'assets/events/1.png',
    'assets/events/1_1.png',
    'assets/events/1_3.png',
    'assets/events/1_4.png',
    'assets/events/1_5.png',
    'assets/events/1_6.png',
  ];

  @override
  Widget build(BuildContext context) {
    disable();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
        body: Container(
            child: Stack(
              children: <Widget>[
                ListView(
                    padding: const EdgeInsets.only(top: 10),
                    children: <Widget>[_titulo(), miCard(), miCard()]),
              ],
            )));
  }

  Card miCard() {
    return Card(
      color: Color.fromARGB(200, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
                'Saló de l’Ensenyament 2019 - ( 20/03/2019 - 24/03/2019 )'),
            subtitle: Text('Montjuïc, Barcelona, Spain'),
            leading: Image.asset('assets/events/iconoSalon.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          CarouselSlider.builder(
            itemCount: imgList.length,
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              scrollDirection: Axis.horizontal,
              pauseAutoPlayOnTouch: true,
              onPageChanged: (index, reason) {
                setState(() {});
              },
            ),
            itemBuilder: (context, index, realIdx) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.network(imgList[index], fit: BoxFit.fill),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _titulo() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Text('EVENTS',
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
          )));
}

void disable() {
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
}
