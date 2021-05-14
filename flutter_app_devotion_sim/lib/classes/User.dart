import 'package:flutter_app_devotion_sim/classes/QRList.dart';
import 'package:flutter_app_devotion_sim/classes/UserInterface.dart';

enum UserLevel {
  SELLER,
  COSTUMER
}

class User implements UserInterface{
  int _userID;
  String _nickname;
  String _email;
  QRList _qrList;

  setUserId(int id) {
    this._userID = id;
  }

  int getUserId() {
    return this._userID;
  }

  setNickname(String nickname) {
    this._nickname = nickname;
  }

  String getNickname() {
    return this._nickname;
  }

  setEmail(String email) {
    this._email = email;
  }

  String getEmail() {
    return this._email;
  }

  setQRList(QRList list) {
    this._qrList = list;
  }

  QRList getQRList() {
    return this._qrList;
  }

  User(int id, String nickname, String email, QRList list) {
    this._userID = id;
    this._nickname = nickname;
    this._email = email;
    this._qrList = list;
  }

  @override
  bool createAccount() {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  bool login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  bool logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  bool uploadQRList(QRList list) {
    // TODO: implement uploadQRList
    throw UnimplementedError();
  }
}