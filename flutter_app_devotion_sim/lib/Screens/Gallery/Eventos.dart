import 'package:flutter/material.dart';
import 'carrusel.dart';

class Gallery extends StatelessWidget {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 64, 64, 64),
        body: ListView(
          children: <Widget>[
            miCard(),
            miCardImage(),
            miCardDesign(),
            miCardImageCarga(),
          ],
        ));
  }

  Card miCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('EVENT NAME - ( YYYY/MM/DD )'),
            subtitle: Text('Descripción Evento'),
            leading: Image.asset('assets/gallery/iconoEventos.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          const _PictureGrid(),
          CustomIndicator(),
        ],
      ),
    );
  }

  Card miCardImage() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image.asset('assets/gallery/foto1.jpg'),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("background.gif"), fit: BoxFit.cover)),
            padding: EdgeInsets.all(3),
            child: Text('Montañas'),
          ),
        ],
      ),
    );
  }

  Card miCardImageCarga() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://staticuestudio.blob.core.windows.net/buhomag/2016/03/01195417/pexels-com.jpg'),
            placeholder: AssetImage('assets/play.png'),
            fit: BoxFit.cover,
            height: 260,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Paisaje con carga'),
          )
        ],
      ),
    );
  }

  Card miCardDesign() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      color: Color(0xFFE6EE9C),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Titulo'),
            subtitle: Text(
                'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
            leading: Icon(Icons.home),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () => {}, child: Text('Aceptar')),
              TextButton(onPressed: () => {}, child: Text('Cancelar'))
            ],
          )
        ],
      ),
    );
  }
}

class _PictureGrid extends StatelessWidget {
  const _PictureGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Image.asset(
          'assets/gallery/foto${index + 1}.jpg',
          gaplessPlayback: true,
          fit: BoxFit.fill,
        );
      },
    );
  }
}
