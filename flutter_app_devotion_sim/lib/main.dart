import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/dashboard_screen.dart';
import 'package:flutter_app_devotion_sim/classes/costumer.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/components/device_rotation_locker.dart';
import 'constants.dart';
import 'Screens/Login/login_screen.dart';
import 'Screens/Login/transition_route_observer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Color(0xFF212121),
        primarySwatch: Colors.red,
        accentColor: Colors.red,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'MotoGP',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        DashboardScreen.routeName: (context) => DashboardScreen(new Costumer(0,
            'costumer', 'costumer@costumer.net', new QRList())
        ),
      },
    );
  }
}