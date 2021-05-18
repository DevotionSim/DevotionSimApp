import 'package:flutter/material.dart';
import 'components/generate.dart';
import 'components/state_web.dart';

class GenerateForWeb extends Generate {

  @override
  State<StatefulWidget> createState() {
    return GenerateState();
  }
}

Generate getManager() => GenerateForWeb();

