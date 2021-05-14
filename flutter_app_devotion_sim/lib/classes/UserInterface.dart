import 'package:flutter_app_devotion_sim/classes/QRList.dart';

abstract class UserInterface {
  bool createAccount();
  bool login();
  bool logout();
  bool uploadQRList(QRList list);
}