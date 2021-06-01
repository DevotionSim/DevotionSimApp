import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/dashboard_screen.dart';
import 'package:flutter_app_devotion_sim/Screens/Dashboard/dashboard_screen_seller.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/plantilla/flutter_login.dart';
import 'package:flutter_app_devotion_sim/Screens/Login/src/models/login_data.dart';
import 'package:flutter_app_devotion_sim/classes/costumer.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/classes/seller.dart';
import 'package:flutter_app_devotion_sim/database/database.dart';
import 'constants.dart';
import 'custom_route.dart';
import 'users.dart';

bool isUser = false;
bool correctLogin = false;

//Info user
int id_user = 0;
String usernameUser = '';
String emailUser = '';
bool isAdmin = false;

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) async {
    await login(data.name, data.password);

    return Future.delayed(loginTime).then((_) {
      if (correctLogin == false) {
        return 'Email or password incorrect';
      } else {
        getGeneralDataUser(data.name, data.password);
      }

      return null;
    });
  }

  Future<String?> _signUp(LoginData data) async {
    await userExist(data.name);

    return Future.delayed(loginTime).then((_) async {
      if (isUser == true) {
        return 'Error, email already registered';
      }
      if (isUser == false) {
        await signUp(data.name, data.password);
        getGeneralDataUser(data.name, data.password);
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      logo: 'assets/icons/icon_black_rounded.png',
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      userValidator: (value) {
        if (!value!.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _signUp(loginData);
      },
      onSubmitAnimationCompleted: () {
        if (!isAdmin) {
          Navigator.of(context).pushReplacement(FadePageRoute(
            builder: (context) => DashboardScreen(Costumer(id_user, usernameUser, emailUser, QRList())),
          ));
        }
        else {
         Navigator.of(context).pushReplacement(FadePageRoute(
            builder: (context) => DashboardScreenSeller(Seller(id_user, usernameUser, emailUser, QRList())),
          ));
        }
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
    );
  }
}
