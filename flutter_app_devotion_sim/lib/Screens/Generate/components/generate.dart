import 'package:flutter/material.dart';
import 'generate_stub.dart'
if (dart.library.io) '../generate_screen_for_android.dart'
if (dart.library.js) '../generate_screen_for_web.dart';

abstract class Generate extends StatefulWidget {
  static Generate _instance;

  static Generate get instance {
    _instance ??= getManager();
    return _instance;
  }
}
