import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  GlobalKey _globalKey = new GlobalKey();

  // Controles EditText
  TextEditingController textEditTimer = TextEditingController();
  TextEditingController textEditFalls = TextEditingController();
  TextEditingController textEditLaps = TextEditingController();

  // Booleanas CheckBox
  bool checkBoxTimer = false;
  bool checkBoxFalls = false;
  bool checkBoxLaps = false;
  bool checkBoxLegend = false;

  // Código QR
  String qrData = "";

  // Método constructor
  @override
  Widget build(BuildContext context) {
    // Variables para controlar el tamaño de la pantalla
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    // Valores por defecto para los textEdit
    if (!checkBoxLegend) {
      if (!checkBoxTimer) {
        textEditTimer.text = "0";
      }
      if (!checkBoxFalls) {
        textEditFalls.text = "0";
      }
      if (!checkBoxLaps) {
        textEditLaps.text = "0";
      }
    } else {
      textEditTimer.text = "60";
      textEditFalls.text = "0";
      textEditLaps.text = "0";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Generate"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              width: 560,
              height: 400,
              child: RepaintBoundary(
                key: _globalKey,
                child: Container(
                  alignment: Alignment.center,
                  child: QrImage(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 420,
                    gapless: false,
                    semanticsLabel: "DevotionSim QR",
                    embeddedImage: new AssetImage('assets/devlogo.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(250, 250),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                width: 260,
                height: height,
                child: Column(
                  children: <Row>[
                    Row(
                      children: [
                        // CheckBox Timer
                        SizedBox(
                            width: 160,
                            child: CheckboxListTile(
                              title: Text("Timer ON"),
                              value: checkBoxTimer,
                              onChanged: (newValue) {
                                setState(() {
                                  if (!checkBoxLegend) {
                                    checkBoxTimer = newValue;
                                    textEditTimer.text = "5";
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
                          height: 38.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    size: 18.0,
                                  ),
                                  onTap: () {
                                    if (!checkBoxLegend) {
                                      int currentValue =
                                          int.parse(textEditTimer.text);
                                      setState(() {
                                        currentValue += 5;
                                        textEditTimer.text = (currentValue < 60
                                                ? currentValue
                                                : 60)
                                            .toString(); // incrementing value
                                      });
                                    }
                                  },
                                ),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 18.0,
                                ),
                                onTap: () {
                                  int currentValue =
                                      int.parse(textEditTimer.text);
                                  setState(() {
                                    if (!checkBoxLegend) {
                                      print("Setting state");
                                      currentValue -= 5;
                                      textEditTimer.text =
                                          (currentValue > 5 ? currentValue : 5)
                                              .toString(); // decrementing value
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // CheckBox Falls
                        SizedBox(
                            width: 160,
                            child: CheckboxListTile(
                              title: Text("Falls ON"),
                              value: checkBoxFalls,
                              onChanged: (newValue) {
                                setState(() {
                                  if (!checkBoxLegend) {
                                    checkBoxFalls = newValue;
                                    textEditFalls.text = "3";
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
                          height: 38.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    size: 18.0,
                                  ),
                                  onTap: () {
                                    int currentValue =
                                        int.parse(textEditFalls.text);
                                    setState(() {
                                      if (!checkBoxLegend) {
                                        currentValue++;
                                        textEditFalls.text = (currentValue < 15
                                                ? currentValue
                                                : 15)
                                            .toString(); // incrementing value
                                      }
                                    });
                                  },
                                ),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 18.0,
                                ),
                                onTap: () {
                                  if (!checkBoxLegend) {
                                    int currentValue =
                                        int.parse(textEditFalls.text);
                                    setState(() {
                                      print("Setting state");
                                      currentValue--;
                                      textEditFalls.text =
                                          (currentValue > 3 ? currentValue : 3)
                                              .toString(); // decrementing value
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // CheckBox Laps
                        SizedBox(
                            width: 160,
                            child: CheckboxListTile(
                              title: Text("Laps ON"),
                              value: checkBoxLaps,
                              onChanged: (newValue) {
                                setState(() {
                                  if (!checkBoxLegend) {
                                    checkBoxLaps = newValue;
                                    textEditLaps.text = "3";
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
                          height: 38.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    size: 18.0,
                                  ),
                                  onTap: () {
                                    if (!checkBoxLegend) {
                                      int currentValue =
                                          int.parse(textEditLaps.text);
                                      setState(() {
                                        currentValue++;
                                        textEditLaps.text = (currentValue < 30
                                                ? currentValue
                                                : 30)
                                            .toString(); // incrementing value
                                      });
                                    }
                                  },
                                ),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 18.0,
                                ),
                                onTap: () {
                                  int currentValue =
                                      int.parse(textEditLaps.text);
                                  setState(() {
                                    if (!checkBoxLegend) {
                                      print("Setting state");
                                      currentValue--;
                                      textEditLaps.text =
                                          (currentValue > 3 ? currentValue : 3)
                                              .toString(); // decrementing value
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CheckBox Legend
                        SizedBox(
                            width: 160,
                            child: CheckboxListTile(
                              title: Text("Legend"),
                              value: checkBoxLegend,
                              onChanged: (newValue) {
                                setState(() {
                                  checkBoxLegend = newValue;
                                  checkBoxTimer = newValue;
                                  checkBoxFalls = false;
                                  checkBoxLaps = false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            )),
                      ],
                    )
                  ],
                )),
            Positioned(
              top: 430,
              child: TextButton(
                  child: Text("GENERATE QR"),
                  onPressed: () {
                    var dateNow = DateTime.now();
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

                    timer = int.parse(textEditTimer.text).toRadixString(2);
                    while (timer.length < 8) {
                      timer = "0" + timer;
                    }
                    falls = int.parse(textEditFalls.text).toRadixString(2);
                    while (falls.length < 4) {
                      falls = "0" + falls;
                    }
                    laps = int.parse(textEditLaps.text).toRadixString(2);
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

                    String qrGen = "q";
                    qrGen += checkBoxTimer == true ? "1" : "0";
                    qrGen += checkBoxFalls == true ? "1" : "0";
                    qrGen += checkBoxLaps == true ? "1" : "0";
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

                    setState(() {
                      qrData = qrGen;
                      _capturePng();
                    });
                  }),
            )
          ],
        ),
      )),
    );
  }

  // Método para convertir QR en .png
  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    String dir = (await getApplicationDocumentsDirectory()).path;
    String fullPath = '$dir/abc.png';
  }
}
