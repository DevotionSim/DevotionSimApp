import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../scan_screen.dart';

class ScanScreenState extends State<ScanScreen> {
  Uint8List bytes;
  var screenSize;
  var width;
  var height;

  String qrData;

  @override
  void initState() {
    super.initState();
    qrData = "";
  }

  @override
  Widget build(BuildContext context) {
    // Variables para controlar el tamaño de la pantalla
    screenSize = MediaQuery.of(context).size;
    width = screenSize.width;
    height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 60,
              child: Container(
                alignment: Alignment.center,
                child: _buildQRStructure(),
              ),
            ),
            Positioned(
              top: height / 2,
              child: Container(
                width: 200,
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: InkWell(
                          onTap: _scan,
                          child: Card(
                            color: Colors.cyan[300],
                            child: Container(
                                alignment: Alignment.center,
                                child: Text("Scan")),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: InkWell(
                          onTap: _scanPath,
                          child: Card(
                            color: Colors.cyan[300],
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Open File"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }

  Future _scan() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      String codeQR = await scanner.scan();
      if (codeQR == null) {
        print('nothing return.');
      } else {
        setState(() {
          qrData = codeQR;
        });
      }
    }
    else if (status.isDenied) {
      return;
    }
    else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Camera Permission'),
            content: Text(
                'This app needs camera access to take pictures for upload QR codes to your profile.'),
            actions: <Widget>[
              TextButton(
                child: Text('Deny'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Settings'),
                onPressed: () => openAppSettings(),
              ),
            ],
          ));
    }
  }

  Future _scanFile() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      String codeQR = await scanner.scanPhoto();
      if (codeQR == null) {
        print('nothing return.');
      } else {
        setState(() {
          qrData = codeQR;
        });
      }
    }
    else if (status.isDenied) {
      return;
    }
    else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Storage Permission'),
            content: Text(
                'This app needs storage access to take pictures for upload QR codes to your profile.'),
            actions: <Widget>[
              TextButton(
                child: Text('Deny'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Settings'),
                onPressed: () => openAppSettings(),
              ),
            ],
          ));
    }
  }

  Future _scanPath() async {
    await Permission.storage.request();
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if(image==null) return;
    final codeQR = await scanner.scanPath(image.path);
    setState(() {
      qrData = codeQR;
    });
  }

  Future _scanBytes() async {
    final _picker = ImagePicker();
    PickedFile filePicker = await _picker.getImage(source: ImageSource.camera);
    if (filePicker == null) return;
    final File file = File(filePicker.path);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);

  }

  Future _generateQRCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }

  Widget _buildQRStructure() {
    if(qrData == "") {
      return null;
    } else {
      return QrImage(
        data: qrData,
        version: QrVersions.auto,
        size: width * 0.8,
        gapless: false,
        semanticsLabel: "DevotionSim QR",
        embeddedImage: new AssetImage('assets/devlogo.png'),
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size(200, 200),
        ),
      );
    }
  }
}
