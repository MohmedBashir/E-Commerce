import 'package:e_commerce/core/service/fire_store_user_service.dart';
import 'package:e_commerce/helper/shared_preferences.dart';
import 'package:e_commerce/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/auth/control_view.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LocalSharedPreferences localSharedPreferences = Get.find();

  String? email, password, userName;

  final Rxn<User> _user = Rxn<User>();
  get user => _user.value;

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUser(_auth.currentUser!.uid);
    }
    super.onInit();
  }

  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;

      final AuthCredential googleCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      _auth
          .signInWithCredential(googleCredential)
          .then((user) => saveUser(user));
      Get.offAll(const ControlView());
    } on Exception catch (e) {
      Get.snackbar('wrong entry', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void facebookSignIn() async {
    try {
      FacebookLoginResult result =
          await _facebookLogin.logIn(permissions: [FacebookPermission.email]);

      final accessToken = result.accessToken?.token;
      if (result.status == FacebookLoginStatus.success) {
        final faceBookCredential =
            FacebookAuthProvider.credential(accessToken!);
        _auth
            .signInWithCredential(faceBookCredential)
            .then((user) => saveUser(user));
        Get.offAll(const ControlView());
      }
    } on Exception catch (e) {
      Get.snackbar('wrong entry', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        getCurrentUser(value.user!.uid);
      });
      Get.offAll(const ControlView());
    } catch (e) {
      Get.snackbar('wrong entry', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassowrd() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) => saveUser(user));
      Get.offAll(const ControlView());
    } catch (e) {
      Get.snackbar('wrong entry', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future saveUser(UserCredential userCredential) async {
    UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email,
        name: userName ?? userCredential.user!.displayName,
        photo: userCredential.user!.photoURL ??
            'https://discoverytech.io/wp-content/uploads/2022/09/person-unknown.png');
    await FireStoreUserService().addUserToFireStore(user);
    saveUserToLocalStorage(user);
  }

  getCurrentUser(String uid) async {
    await FireStoreUserService().getCurrentuser(uid).then((value) {
      saveUserToLocalStorage((UserModel.fromJson(value.data()!)));
    });
  }

  void saveUserToLocalStorage(UserModel user) async {
    await localSharedPreferences.setUserData(user);
  }
}
