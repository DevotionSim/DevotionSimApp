import 'package:flutter_app_devotion_sim/classes/costumer_interface.dart';
import 'package:flutter_app_devotion_sim/classes/qr_list.dart';
import 'package:flutter_app_devotion_sim/classes/user.dart';

class Costumer extends User implements CostumerInterface{

  Costumer(int id, String nickname, String email, QRList qrList) : super(id, nickname, email, qrList);

  @override
  bool changeEmail(String email) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }

  @override
  bool changeLanguage(String language) {
    // TODO: implement changeLanguage
    throw UnimplementedError();
  }

  @override
  bool changeNickname(String nickname) {
    // TODO: implement changeNickname
    throw UnimplementedError();
  }

  @override
  bool changeProfileImage() {
    // TODO: implement changeProfileImage
    throw UnimplementedError();
  }

  @override
  checkEvents() {
    // TODO: implement checkEvents
    throw UnimplementedError();
  }

  @override
  checkLocations() {
    // TODO: implement checkLocations
    throw UnimplementedError();
  }

  @override
  checkQRList() {
    // TODO: implement checkQRList
    throw UnimplementedError();
  }

  @override
  checkStatistics() {
    // TODO: implement checkStatistics
    throw UnimplementedError();
  }

  @override
  contactUs() {
    // TODO: implement contactUs
    throw UnimplementedError();
  }

  @override
  goWeb() {
    // TODO: implement goWeb
    throw UnimplementedError();
  }

  @override
  scanQR() {
    // TODO: implement scanQR
    throw UnimplementedError();
  }
}

