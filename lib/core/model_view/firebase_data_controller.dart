import 'package:e_commerce/core/service/fire_store_data_fetching_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../model/category.dart';
import '../../model/product.dart';

class FireBaseDataController extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  get loading => _loading.value;

  final List<CategoryModel> _categories = [];
  get categories => _categories;

  final List<ProductModel> _products = [];
  get products => _products;

  FireBaseDataController() {
    getCategories();
    getProducts();
  }

  getCategories() async {
    _loading.value = true;
    await FireStoreDataFetchingService().getCategory().then((value) {
      for (int i = 0; i < value.size; i++) {
        _categories.add(CategoryModel.fromJson(value.docs[i].data()));
      }
      _loading.value = false;
      update();
    });
  }

  getProducts() async {
    await FireStoreDataFetchingService().getPdoducts().then((value) {
      for (int i = 0; i < value.size; i++) {
        _products.add(ProductModel.fromJson(value.docs[i].data()));
      }

      update();
    });
  }
}
