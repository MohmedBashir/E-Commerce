import 'package:e_commerce/core/model_view/cart_controller.dart';
import 'package:e_commerce/view/internal%20screen/checkout%20screen/widgets/add_address.dart';
import 'package:e_commerce/view/internal%20screen/checkout%20screen/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/internal screen/checkout screen/widgets/complete_purshasing.dart';
import '../../view/internal screen/checkout screen/widgets/delevery_time.dart';

class CheckoutController extends GetxController {
  int _selectedStep = 0;
  int get selectedStep => _selectedStep;

  Widget get body => _checkoutScreens[_selectedStep];

  Delivary _delivary = Delivary.standard;
  get delivary => _delivary;
  setDelivary(Delivary delivary) {
    _delivary = delivary;
    update();
  }

  final List<Widget> _checkoutScreens = [
    const DeliveryTime(),
    const AddAddress(),
    Summary(),
    const PrchaseCompleting()
  ];
  nextStep() {
    if (_selectedStep != 3) {
      _selectedStep++;
      update();
    } else {
      return;
    }
  }

  previousStep() {
    if (_selectedStep != 0) {
      _selectedStep--;
      update();
    } else {
      return;
    }
  }

  bool _checkboxValue = false;
  bool get checkboxValue => _checkboxValue;

  changecheckboxValue(bool? value) {
    _checkboxValue = value!;
    update();
  }

  CartController cartController = Get.find();

  String street1 = '';
  String street2 = '';
  String city = '';
  String state = '';
  String country = '';

  String shippingAddress =
      '21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria';
}

enum Delivary { standard, nextDay, nominated }
