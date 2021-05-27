import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/components/device_rotation_locker.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';
//import 'dart:js' as js;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with PortraitModeMixin {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    /*js.context.callMethod('alertMessage', ['Flutter is calling upon JavaScript!']);
    js.context.callMethod('logger', [34]);
    var state = js.JsObject.fromBrowserObject(js.context['state']);
    print(state['hello']);*/

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
