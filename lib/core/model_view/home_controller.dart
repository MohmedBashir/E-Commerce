import 'package:e_commerce/view/home/cart_screen.dart';
import 'package:e_commerce/view/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/home/explore_screen.dart';

class HomeController extends GetxController {
  int _selectedBotoomNavBar = 0;
  Widget _selectedScreen = const ExploreScreen();
  get selectedBotoomNavBar => _selectedBotoomNavBar;

  get selectedScreen => _selectedScreen;

  onTapBottomNavBar(value) {
    switch (value) {
      case 0:
        _selectedScreen = const ExploreScreen();
        break;
      case 1:
        _selectedScreen = const CartScreen();
        break;
      case 2:
        _selectedScreen = ProfileScreen();
        break;
    }
    _selectedBotoomNavBar = value;
    update();
  }
}
