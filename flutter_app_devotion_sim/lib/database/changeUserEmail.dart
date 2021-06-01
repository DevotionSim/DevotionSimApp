import 'package:flutter_app_devotion_sim/Screens/Configuration/components/change_gmail_screen_state.dart';
import 'package:flutter_app_devotion_sim/Screens/Configuration/components/change_username_screen_state.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/login_screen.dart';
import 'package:mysql1/mysql1.dart';

Future changeUsername() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  await conn.query(
      'update users set username =? where email = ?', [NewUserName, emailUser]);

  // Finally, close the connection
  await conn.close();

  usernameUser = NewUserName;
}

Future changeEmail() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'remotemysql.com',
      port: 3306,
      user: 'ZHBWs3xccc',
      db: 'ZHBWs3xccc',
      password: 'ZKvuWiFbjy'));

  await conn.query(
      'update users set email =? where email = ?', [NewEmail, emailUser]);

  // Finally, close the connection
  await conn.close();

  emailUser = NewEmail;
}
