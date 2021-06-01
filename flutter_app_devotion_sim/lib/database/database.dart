import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_app_devotion_sim/Screens/Login/login_screen.dart';
import 'package:flutter_app_devotion_sim/classes/qr_code.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/classes/stats_list.dart';
import 'package:flutter_app_devotion_sim/utils/utils.dart';
import 'package:mysql1/mysql1.dart';

/////////////////////////////////////////////////////////////////////////////////////////
///LOGIN AND SIGN IN
////////////////////////////////////////////////////////////////////////////////////////

//Check if the email is registered
Future userExist(email) async {
  // Open a connection
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  //Check if exist user
  var result =
      await conn.query('select * from users where email = (?)', [email]);

  if (result.isNotEmpty) {
    isUser = true;
  }
  await conn.close();
}

Future signUp(email, pass) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  // Create user
  var createUser = await conn.query(
      'insert into users (username, email, pass, admin) values (?, ?, ?, ?)',
      ['Usernumber', email, pass, false]);
  //print('Inserted row id=${result.insertId}');

  await conn.query('update users set username =? where email = ?',
      ['User#000${createUser.insertId}', email]);

  // Finally, close the connection
  await conn.close();
}

Future login(email, pass) async {
  // Open a connection
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  // Search user user
  var result = await conn.query(
      'select * from users where email = (?) and pass = (?)', [email, pass]);

  //True if user exist
  if (result.isNotEmpty) {
    correctLogin = true;
  }
  await conn.close();
}

Future getGeneralDataUser(email, pass) async {
  // Open a connection
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  // Search user user
  var results = await conn.query(
      'select * from users where email = (?) and pass = (?)', [email, pass]);

  for (var row in results) {
    id_user = row[0];
    usernameUser = row[1];
    emailUser = row[2];
    isAdmin = row[4] == 1 ? true : false;
  }
  await conn.close();
}

//Future<List>

/////////////////////////////////////////////////////////////////////////////////////////
///STATS
////////////////////////////////////////////////////////////////////////////////////////

//INSERT QR
Future insertQr(id_user, code, disabled) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  // Checks if qr exists
  var results = await conn.query('select * from qr where code = (?)', [code]);

  if (results.isEmpty) {
    // Create qr in BD
    var createQR = await conn.query(
        'insert into qr (id_user, code, disabled, json_stats) values (?, ?, ?, ?)',
        [id_user, code, disabled ? 1 : 0, null]);
  }

  // Finally, close the connection
  await conn.close();
}

//INFO QR

int get_id_qr = 0;
int get_id_user = 0;
String code = '';
int disabled = 0;

Future selectQr(id_qr, id_user) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  var results = await conn.query(
      'select * from qr where id_qr = (?) and id_user = (?)', [id_qr, id_user]);

  for (var row in results) {
    get_id_qr = row[0];
    get_id_user = row[1];
    code = row[2];
    disabled = row[3];
  }
  // Finally, close the connection
  await conn.close();
}

Future<QRList> selectQrList(id_user) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));


  var resultsCodes = await conn.query(
      'select code from qr where id_user = (?)',
      [id_user]);

  var resultsStats = await conn.query(
      'select json_stats from qr where id_user = (?) and json_stats IS NOT NULL',
      [id_user]);

  QRList qrList = QRList();

  List<String> codes = <String>[];

  for(int i = 0; i < resultsCodes.length; i++) {
    codes.add(resultsCodes.elementAt(i)['code']);
  }

  if (resultsStats.length > 1) {
    for (int i = 0; i < resultsStats.length; i++) {
      var json = jsonDecode(resultsStats
          .elementAt(i)
          .values
          .toString()
          .substring(1, resultsStats.elementAt(i).values.toString().length - 1));
      StatsList list = StatsList.fromJson(json);
      qrList.addQR(QRCode.withStats(list.codeId!, list));
    }
  } else if (resultsStats.isNotEmpty) {
    for (var row in resultsStats) {
      var json = jsonDecode(
          row.toString().substring(21, resultsStats.toString().length - 3));
      StatsList list = StatsList.fromJson(json);
      qrList.addQR(QRCode.withStats(list.codeId!, list));
    }
  }
  // Finally, close the connection
  await conn.close();

  return qrList;
}

// INSERT STATS

Future insertStats(id_user, id_qr, time, gas, speed, gear, lean, front_brake,
    rear_brake) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  // Create qr in BD
  var createStats = await conn.query(
      'insert into stats (id_user, id_qr, time, gas, speed, gear, lean, front_brake, rear_brake) values (?, ?, ?,?,?,?,?,?,?)',
      [id_user, id_qr, time, gas, speed, gear, lean, front_brake, rear_brake]);

  // Finally, close the connection
  await conn.close();
}

int getIdStats = 0;
int getIdUser = 0;
int getIdQr = 0;
String getTime = '';
int getGas = 0;
int getSpeed = 0;
int getGear = 0;
int getLean = 0;
int frontBrake = 0;
int rearBrake = 0;

Future selectStats(id_stats, id_user_stats) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  var results = await conn.query(
      'select * from stats where id = ? and id_user = ?',
      [id_stats, id_user_stats]);

  for (var row in results) {
    print(row[0]);
    getIdStats = row[0];
    getIdUser = row[1];
    getIdQr = row[2];
    getTime = row[3];
    getGas = row[4];
    getSpeed = row[5];
    getGear = row[6];
    getLean = row[7];
    frontBrake = row[8];
    rearBrake = row[9];
  }
  // Finally, close the connection
  await conn.close();
}

Future main() async {
  //agregar qr
  //await insertQr(10, 'q10101010', false);

  //Ver info del qr
  await selectQr(3, 10);
  print('qr');
  print(get_id_qr);
  print(get_id_user);
  print(disabled);

//add states
  // insertStats(10, 3, '1:00', 100, 200, 30, 20, 40, 20);

//get states
  selectStats(1, 10);
  print(getIdStats);
  print(getIdUser);
  print(getIdQr);
  print(getTime);
  print(getGas);
  print(getSpeed);
  print(getGear);
  print(getLean);
  print(frontBrake);
  print(rearBrake);
}
