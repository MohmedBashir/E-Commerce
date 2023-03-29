import 'package:e_commerce/helper/shared_preferences.dart';
import 'package:e_commerce/model/user.dart';
import 'package:e_commerce/view/auth/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  final LocalSharedPreferences localSharedPreferences = Get.find();

  final ValueNotifier<bool> _loading = ValueNotifier(true);
  bool get loading => _loading.value;

  UserModel _user = UserModel();
  UserModel get user => _user;

  @override
  void onInit() async {
    getCurrentUser();
    super.onInit();
  }

  getCurrentUser() async {
    _loading.value = true;
    await localSharedPreferences.getUserData().then((value) {
      _user = value;
    });
    _loading.value = false;
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localSharedPreferences.clearLocalDatabase();
    Get.offAll(const SignInScreen());
  }
}
