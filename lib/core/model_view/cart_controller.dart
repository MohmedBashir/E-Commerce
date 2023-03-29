import 'package:e_commerce/core/service/database/cart_database_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var dpHelper = CartDataBaseHelper.db;

  CartController() {
    _getAllProducts();
  }
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> get cartProductsList => _cartProductsList;
  List<CartProductModel> _cartProductsList = [];

  num get totalPrice => _updatetotalPrice();

  num _updatetotalPrice() {
    num sum = 0;
    _cartProductsList.forEach((element) {
      sum += num.parse(element.price!) * element.quantity!;
    });
    update();
    return sum;
  }

  addToCart(CartProductModel product) async {
    await dpHelper.insertToDatabase(product);
    _getAllProducts();
    _updatetotalPrice();
  }

  _getAllProducts() async {
    _loading = ValueNotifier(true);

    _cartProductsList = await dpHelper.getAllProduct();
    _loading = ValueNotifier(false);
    update();
  }

  deleteFromCart(String id) async {
    await dpHelper.deletFromDatabase(id);
    _getAllProducts();
  }

  void quantityIncrease(CartProductModel product) async {
    product.quantity = product.quantity! + 1;
    await dpHelper.updateDatabase(product);
    update();
  }

  void quantityDecrease(CartProductModel product) async {
    if (product.quantity == 1) return;
    product.quantity = product.quantity! - 1;
    await dpHelper.updateDatabase(product);
    update();
  }
}
