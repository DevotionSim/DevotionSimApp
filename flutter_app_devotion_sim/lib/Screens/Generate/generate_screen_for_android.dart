import 'package:flutter/material.dart';
import 'components/generate.dart';
import 'components/state_android.dart';

class GenerateForAndroid extends Generate {

  @override
  State<StatefulWidget> createState() {
    return GenerateState();
  }
}

Generate getManager() => GenerateForAndroid();
