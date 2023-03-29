import 'dart:convert';

import 'package:e_commerce/model/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreferences extends GetxController {
  Future<UserModel?> get userData async {
    try {
      UserModel user = await getUserData();
      return user;
    } on Exception catch (e) {
      print(e);
    }
  }

  setUserData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(user));
  }

  Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('user');
    return UserModel.fromJson(json.decode(value!));
  }

  clearLocalDatabase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
