import 'package:e_commerce/core/model_view/home_controller.dart';
import 'package:e_commerce/core/model_view/auth_controller.dart';
import 'package:e_commerce/view/auth/sign_in_screen.dart';
import 'package:e_commerce/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthController> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.user == null
          ? const SignInScreen()
          : GetBuilder(
              init: HomeController(),
              builder: (controller) => const HomeScreen())),
    );
  }
}
