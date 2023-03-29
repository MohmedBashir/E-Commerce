import 'package:e_commerce/core/model_view/auth_controller.dart';
import 'package:e_commerce/core/model_view/firebase_data_controller.dart';
import 'package:e_commerce/core/model_view/home_controller.dart';
import 'package:get/get.dart';

import '../core/model_view/cart_controller.dart';
import '../core/model_view/checkout_controller.dart';
import '../core/model_view/profile_controller.dart';
import 'shared_preferences.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FireBaseDataController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => LocalSharedPreferences());
    Get.lazyPut(() => CheckoutController());
  }
}
