import 'package:flutter_app_devotion_sim/classes/user_interface.dart';

enum UserLevel {
  SELLER,
  COSTUMER
}

class User implements UserInterface{
  int? _userID;
  String? _nickname;
  String? _email;

  setUserId(int id) {
    this._userID = id;
  }

  int? getUserId() {
    return this._userID;
  }

  setNickname(String nickname) {
    this._nickname = nickname;
  }

  String? getNickname() {
    return this._nickname;
  }

  setEmail(String email) {
    this._email = email;
  }

  String? getEmail() {
    return this._email;
  }

  User(int id, String nickname, String email) {
    this._userID = id;
    this._nickname = nickname;
    this._email = email;
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
}