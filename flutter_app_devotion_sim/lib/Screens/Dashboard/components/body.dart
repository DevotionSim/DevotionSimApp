import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/components/background.dart';
import 'dart:math';
import 'dart:ui';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Background(
      child:  SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados()
              ],
            ),
          )
    );
  }

    Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );


    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]
          )
        ),
      )
    );
    
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa
        )
      ],
    );

  }

 Widget _titulos() {

    return SafeArea(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Text('AS'),
              backgroundColor: Colors.grey,
              ),
              Text(
                'Aldo Santa María',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5),
              ),
            ],
          ),
    );

  }

  Widget _bottomNavigationBar(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme
          .copyWith( caption: TextStyle( color: Color.fromRGBO(116, 117, 152, 1.0) ) )
      ),
      child: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today, size: 30.0 ),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.bubble_chart, size: 30.0 ),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.supervised_user_circle, size: 30.0 ),
            title: Container()
          ),
        ],
      ),
    );

  }

  Widget _botonesRedondeados() {

    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.black38, Icons.border_all, 'General' ),
            _crearBotonRedondeado( Colors.black38, Icons.collections, 'Photos' ),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.black38, Icons.shop, 'Buy' ),
              _crearBotonRedondeado( Colors.black38, Icons.movie_filter, 'Entertaiment' ),
           
          ]
        ),
        TableRow(
          children: [
          
            _crearBotonRedondeado( Colors.black38, Icons.location_on, 'Location' ),
             _crearBotonRedondeado( Colors.black38, Icons.insert_drive_file, 'File' ),
          ]
        ),

        TableRow(
          children: [
          
            _crearBotonRedondeado( Colors.black38, Icons.stacked_line_chart_sharp, 'Statistics' ),
             _crearBotonRedondeado( Colors.black38, Icons.settings, 'Preferences' ),
          ]
        ),
      ],
    );

  }

  Widget _crearBotonRedondeado( Color color, IconData icono, String texto ) {
 
 
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0 ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(205, 206, 207, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox( height: 5.0 ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon( icono, color: Colors.white, size: 30.0 ),
              ),
              Text( texto , style: TextStyle( color: color )),
              SizedBox( height: 5.0 )
            ],
          ),
 
        ),
      ),
    );
  }
}
