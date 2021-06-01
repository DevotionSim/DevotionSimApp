import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Configuration/change_gmail_screen%20.dart';
import 'package:flutter_app_devotion_sim/database/changeUserEmail.dart';

String NewEmail = '';

class changeEmailScreenState extends State<changeEmailScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Container(
        color: Color.fromARGB(255, 33, 33, 33),
        child: Column(children: <Widget>[
          _titulo(),
          Container(
              margin: EdgeInsets.only(top: 100),
              child: TextField(
                controller: nameController,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'New email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    NewEmail = text;
                    //you can access nameController in its scope to get
                    // the value of text entered as shown below
                    //UserName = nameController.text;
                  });
                },
              )),
          Container(
            margin: EdgeInsets.all(20),
          ),
          _button(context)
        ]),
      ))),
    );
  }
}

Widget _titulo() {
  return Container(
      margin: const EdgeInsets.only(top: 100),
      width: double.infinity,
      child: Text('CHANGE EMAIL',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.redAccent,
            fontFamily: 'MotoGP',
            fontSize: 40,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-2, -2),
                  color: Colors.white),
            ],
          )));
}

Widget _button(context) {
  return new TextButton(
    style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.redAccent,
        onSurface: Colors.black),
    child: Container(
      width: 100,
      height: 30,
      child: Text(
        "SAVE",
        style: TextStyle(
          fontFamily: 'MotoGP',
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    onPressed: () {
      changeEmail();
      showAlertDialog(context);
    },
  );
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Succsess"),
    content: Text("Email changed"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
