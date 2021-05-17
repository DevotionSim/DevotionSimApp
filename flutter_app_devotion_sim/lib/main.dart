import 'package:flutter/material.dart';
import 'Screens/Welcome/scroll_page.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Color(0xFF212121),
      ),
      home: WelcomeScreen(),
    );
  }
}
