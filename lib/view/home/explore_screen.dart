import 'package:e_commerce/core/model_view/firebase_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/category.dart';
import '../../model/product.dart';
import '../internal screen/product_details_screen.dart';
import '../widgets/custom_text.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireBaseDataController>(
      init: Get.put(FireBaseDataController()),
      builder: (controller) => controller.loading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      searchBar(),
                      const SizedBox(height: 20),
                      categoriesScetion(controller.categories),
                      const SizedBox(height: 20),
                      bestSellingSection(controller.products),
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}

bestSellingSection(List<ProductModel> products) {
  _product(ProductModel product) {
    return GestureDetector(
      onTap: () => Get.to(ProductDetailsScreen(product: product)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.pic!,
              height: 250,
            ),
          ),
          const SizedBox(height: 10),
          CustomText(
            text: product.name!,
            color: Colors.black,
            size: 18,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 5),
          CustomText(
            text: product.description!,
            color: Colors.black45,
            size: 16,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 5),
          CustomText(
            text: '\$ ${product.price!}',
            color: Colors.green,
            size: 18,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            text: 'Best Selling',
            size: 26,
            fontWeight: FontWeight.w400,
          ),
          TextButton(
              onPressed: () {},
              child: const CustomText(
                text: 'See all',
                size: 18,
                fontWeight: FontWeight.w300,
              )),
        ],
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 350,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _product(products[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: products.length,
        ),
      ),
    ],
  );
}

categoriesScetion(List<CategoryModel> categories) {
  _category(CategoryModel category) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          child: Image.network(
            category.image!,
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(height: 10),
        CustomText(
          text: category.name!,
          size: 18,
          fontWeight: FontWeight.w300,
        )
      ],
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const CustomText(
        text: 'Categories',
        size: 26,
        fontWeight: FontWeight.w400,
      ),
      const SizedBox(height: 20),
      SizedBox(
        height: 110,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _category(categories[index]),
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 15),
        ),
      )
    ],
  );
}

Widget searchBar() {
  return Container(
    padding: const EdgeInsets.only(left: 10),
    height: 55,
    decoration: BoxDecoration(
        color: const Color.fromARGB(151, 221, 221, 221),
        borderRadius: BorderRadius.circular(30)),
    child: const TextField(
      style: TextStyle(fontSize: 25),
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 28,
          )),
    ),
  );
}
