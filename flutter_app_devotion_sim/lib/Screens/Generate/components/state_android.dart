import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_devotion_sim/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'generate.dart';
import 'dart:ui' as ui;

class GenerateState extends State<Generate> {
  GlobalKey? _globalKey;
  late Uint8List pngBytes;

  // Controles EditText
  TextEditingController? textEditTimer;
  TextEditingController? textEditFalls;
  TextEditingController? textEditLaps;

  // Booleanas CheckBox
  late var checkBoxArray;

  // Código QR
  late String qrData;
  late bool qrDataChanged;
  late String qrDate;

  // Control TextButton
  late bool _isButtonDisabled;

  // Método inicio variables
  @override
  void initState() {
    super.initState();

    _globalKey = new GlobalKey();
    pngBytes = Uint8List(0);

    textEditTimer = TextEditingController();
    textEditFalls = TextEditingController();
    textEditLaps = TextEditingController();

    textEditTimer!.text = "0";
    textEditFalls!.text = "0";
    textEditLaps!.text = "0";

    checkBoxArray = [false, false, false, false];

    qrData = "";
    qrDataChanged = false;

    _isButtonDisabled = false;
  }

  // Método constructor
  @override
  Widget build(BuildContext context) {
    // Variables para controlar el tamaño de la pantalla
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    if(qrDataChanged) {
      qrDataChanged = false;
      wait(const Duration(milliseconds: 250)).whenComplete(() =>
          _capturePng().whenComplete(() => convertImageToFile(pngBytes)));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
            width: width,
            height: height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 30,
                    child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text('QR GENERATOR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'MotoGP',
                              fontSize: 55,
                              shadows: [
                                Shadow(
                                  // bottomLeft
                                    offset: Offset(-2, -2),
                                    color: Colors.black),
                              ],
                            )
                        )
                    )
                ),
                Positioned(
                  top: height * 0.17,
                  child: RepaintBoundary(
                    // Assigns the key to identify QR Widget
                    key: _globalKey,
                    child: Container(
                      alignment: Alignment.center,
                      child: QrImage(
                        data: qrData,
                        version: QrVersions.auto,
                        size: width * 0.9,
                        gapless: false,
                        semanticsLabel: "DevotionSim QR",
                        embeddedImage: new AssetImage('assets/devlogo.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: Size(200, 200),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: height * 0.62,
                    width: 310,
                    child: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              // CheckBox Timer
                              Container(
                                  width: 160,
                                  child: CheckboxListTile(
                                    title: Text("Timer ON"),
                                    value: checkBoxArray[0],
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (!checkBoxArray[3]) {
                                          checkBoxArray[0] = newValue;
                                          textEditTimer!.text = newValue! ? "5" : "0";
                                        }
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .leading, //  <-- leading Checkbox
                                  )),
                              // EditText Timer
                              Container(
                                width: 50,
                                height: 24,
                                child: TextFormField(
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  controller: textEditTimer,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: false,
                                    signed: true,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              // UpDownButtons Timer
                              Container(
                                height: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      child: Icon(
                                        Icons.do_disturb_on_outlined,
                                        size: 28.0,
                                      ),
                                      onTap: () {
                                        decrementValue(textEditTimer!, 0, !checkBoxArray[3], 5, 5);
                                      },
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 28.0,
                                      ),
                                      onTap: () {
                                        incrementValue(textEditTimer!, 0, !checkBoxArray[3], 5, 5, 60);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              // CheckBox Falls
                              SizedBox(
                                  width: 160,
                                  child: CheckboxListTile(
                                    title: Text("Falls ON"),
                                    value: checkBoxArray[1],
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (!checkBoxArray[3]) {
                                          checkBoxArray[1] = newValue;
                                          textEditFalls!.text = newValue! ? "3" : "0";
                                        }
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .leading, //  <-- leading Checkbox
                                  )),
                              // EditText Falls
                              Container(
                                width: 50,
                                height: 24,
                                child: TextFormField(
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  controller: textEditFalls,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: false,
                                    signed: true,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              // UpDownButtons Falls
                              Container(
                                height: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      child: Icon(
                                        Icons.do_disturb_on_outlined,
                                        size: 28.0,
                                      ),
                                      onTap: () {
                                        decrementValue(textEditFalls!, 1, !checkBoxArray[3], 1, 3);
                                      },
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 28.0,
                                      ),
                                      onTap: () {
                                        incrementValue(textEditFalls!, 1, !checkBoxArray[3], 1, 3, 15);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              // CheckBox Laps
                              SizedBox(
                                  width: 160,
                                  child: CheckboxListTile(
                                    title: Text("Laps ON"),
                                    value: checkBoxArray[2],
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (!checkBoxArray[3]) {
                                          checkBoxArray[2] = newValue;
                                          textEditLaps!.text = newValue! ? "3" : "0";
                                        }
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .leading, //  <-- leading Checkbox
                                  )),
                              // EditText Laps
                              Container(
                                width: 50,
                                height: 24,
                                child: TextFormField(
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  controller: textEditLaps,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: false,
                                    signed: true,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              // UpDownButtons Laps
                              Container(
                                height: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      child: Icon(
                                        Icons.do_disturb_on_outlined,
                                        size: 28.0,
                                      ),
                                      onTap: () {
                                        decrementValue(textEditLaps!, 2,!checkBoxArray[3], 1, 3);
                                      },
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 28.0,
                                      ),
                                      onTap: () {
                                        incrementValue(textEditLaps!, 2, !checkBoxArray[3], 1, 3, 30);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            // CheckBox Legend
                            SizedBox(
                                width: 160,
                                child: CheckboxListTile(
                                  title: Text("Legend"),
                                  value: checkBoxArray[3],
                                  onChanged: (newValue) {
                                    setLegend(newValue);
                                  },
                                  controlAffinity: ListTileControlAffinity
                                      .leading, //  <-- leading Checkbox
                                )),
                          ],
                        )
                      ],
                    )),
                Positioned(
                  top: height * 0.9,
                  child: _buildTextButton(),
                )
              ],
            ),
          )),
    );
  }

  // Método asíncrono para convertir Widget en Uint8List
  Future<void> _capturePng() async {
    final RenderRepaintBoundary boundary = _globalKey!.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    pngBytes = byteData!.buffer.asUint8List();
  }

  // Método asíncrono para guardar Uint8List como fichero .png en iOS y Android
  Future<File> convertImageToFile(Uint8List image) async {
    final file = File(
        '${(await getExternalStorageDirectory())!.path}/'
            'QR_${qrDate.substring(0, 4)}${qrDate.substring(5, 7)}'
            '${qrDate.substring(8, 10)}_${qrDate.substring(11, 13)}'
            '${qrDate.substring(14, 16)}${qrDate.substring(17, 19)}.png');

    await file.writeAsBytes(image);
    print(file.absolute);
    print(file.uri);

    setState(() {
      _isButtonDisabled = false;
    });

    return file;
  }

  // Constructor TextButton
  Widget _buildTextButton() {
    return new TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.redAccent,
        onSurface: Colors.black
      ),
      child: Text("GENERATE QR",
        style: TextStyle(
          fontFamily: 'MotoGP',
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      onPressed: _isButtonDisabled ? null : _generateQR);
  }

  // Método generador de QR's
  void _generateQR() {
    bool checks = false;

    // Comprueba que los checkBox estén activados
    for(int i = 0; i < 3; i++) {
      if(checkBoxArray[i] == true) {
        checks = true;
        break;
      }
    }

    // No genera QR si los checkBox están desactivados
    if(!checks) {
      return;
    }

    // Define la fecha actual y los valores necesarios
    var dateNow = DateTime.now();
    qrDate = dateNow.toIso8601String();
    String timer,
        falls,
        laps,
        day,
        month,
        year,
        hour,
        minute,
        second;

    day = dateNow.day.toRadixString(2);
    month = dateNow.month.toRadixString(2);
    year = dateNow.year.toRadixString(2);
    hour = dateNow.hour.toRadixString(2);
    minute = dateNow.minute.toRadixString(2);
    second = dateNow.second.toRadixString(2);

    /* Convierte los valores a binarios y agrega ceros a la izquierda
     * para completar la longitud necesaria para cada sección del QR
     */
    timer = int.parse(textEditTimer!.text).toRadixString(2);
    while (timer.length < 8) {
      timer = "0" + timer;
    }
    falls = int.parse(textEditFalls!.text).toRadixString(2);
    while (falls.length < 4) {
      falls = "0" + falls;
    }
    laps = int.parse(textEditLaps!.text).toRadixString(2);
    while (laps.length < 8) {
      laps = "0" + laps;
    }
    while (day.length < 8) {
      day = "0" + day;
    }
    while (month.length < 4) {
      month = "0" + month;
    }
    while (year.length < 12) {
      year = "0" + year;
    }
    while (hour.length < 8) {
      hour = "0" + hour;
    }
    while (minute.length < 8) {
      minute = "0" + minute;
    }
    while (second.length < 8) {
      second = "0" + second;
    }

    // Construye la cadena QR
    String qrGen = "q";
    qrGen += checkBoxArray[0] == true ? "1" : "0";
    qrGen += checkBoxArray[1] == true ? "1" : "0";
    qrGen += checkBoxArray[2] == true ? "1" : "0";
    qrGen += timer;
    qrGen += falls;
    qrGen += laps;
    qrGen += day;
    qrGen += month;
    qrGen += year;
    qrGen += hour;
    qrGen += minute;
    qrGen += second;
    qrGen += "q";

    // Envía los cambios al sistema
    setState(() {
      _isButtonDisabled = true;
      qrData = qrGen;
      qrDataChanged = true;
    });
  }

  void incrementValue(TextEditingController textEdit, int checkBoxIndex, bool isEditable, int value, int enablingValue, int maxValue) {
    int currentValue =
    int.parse(textEdit.text);
    setState(() {
      if (isEditable) {
        if(currentValue < enablingValue) {
          currentValue = enablingValue;
          checkBoxArray[checkBoxIndex] = true;
        } else {
          currentValue += value;
        }

        textEdit.text =
            (currentValue < maxValue ? currentValue : maxValue)
                .toString(); // incrementing value
      }
    });
  }

  void decrementValue(TextEditingController textEdit, int checkBoxIndex, bool isEditable, int value, int minValue) {
    int currentValue =
    int.parse(textEdit.text);
    setState(() {
      if (isEditable) {
        if(currentValue == minValue) {
          currentValue = 0;
          checkBoxArray[checkBoxIndex] = false;
        } else if(currentValue != 0){
          currentValue -= value;
        }

        textEdit.text = currentValue.toString(); // decrementing value
      }
    });
  }

  void setLegend(bool? newValue) {
    setState(() {
      checkBoxArray[3] = newValue;
      checkBoxArray[0] = newValue;
      checkBoxArray[1] = false;
      checkBoxArray[2] = false;

      textEditTimer!.text = newValue! ? "60" : "0";
      textEditFalls!.text = "0";
      textEditLaps!.text = "0";
    });
  }
}