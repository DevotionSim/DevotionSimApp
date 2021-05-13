import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Uint8List bytes = Uint8List(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
        centerTitle: true,
      ),
      body: Container(

      ),
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {

    }
  }

  Future _scanPhoto() async {
    await Permission.storage.request();
    String barcode = await scanner.scanPhoto();

  }

  Future _scanPath(String path) async {
    await Permission.storage.request();
    String barcode = await scanner.scanPath(path);

  }

  Future _scanBytes() async {
    final _picker = ImagePicker();
    PickedFile filePicker = await _picker.getImage(source: ImageSource.camera);
    if (filePicker == null) return;
    final File file = File(filePicker.path);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);

  }

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }

  void expanded() {
    Expanded(
      flex: 5,
      child: GestureDetector(
        onTap: () async {
          final success =
          await ImageGallerySaver.saveImage(this.bytes);
          SnackBar snackBar;
          if (success) {
            snackBar = new SnackBar(
                content:
                new Text('Successful Preservation!'));
            Scaffold.of(context).showSnackBar(snackBar);
          } else {
            snackBar = new SnackBar(
                content: new Text('Save failed!'));
          }
        },
        child: Text(
          'save',
          style:
          TextStyle(fontSize: 15, color: Colors.blue),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
