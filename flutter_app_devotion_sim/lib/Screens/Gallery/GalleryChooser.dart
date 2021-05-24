import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryChooser extends StatefulWidget {
  @override
  _GalleryChooserState createState() => _GalleryChooserState();
}

class _GalleryChooserState extends State<GalleryChooser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text("GALLERY"),
      Expanded(
        child: _contentListView(),
      ),
    ]));
  }

  Widget _contentListView() {
    return ListView(children: [
      Container(
        height: 200,
        child: Card(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridTile(
            child: Center(child: Text("Algo")),
          ),
        ),
      ),
      Container(
        height: 200,
        child: Card(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridTile(
            child: Center(child: Text("Algo")),
          ),
        ),
      )
    ]);
  }
}
