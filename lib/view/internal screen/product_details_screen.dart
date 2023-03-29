import 'package:e_commerce/core/model_view/cart_controller.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/view/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cart_product_model.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          productDetails(context),
          backButton(),
          starButton(),
          addToCartSection(context),
        ]),
      ),
    );
  }

  Padding starButton() {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 25,
            child: Icon(
              Icons.star_border_rounded,
              color: Colors.black,
              size: 35,
            ),
          )),
    );
  }

  Padding backButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            }),
      ),
    );
  }

  SingleChildScrollView productDetails(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
            height: 350,
            width: MediaQuery.of(context).size.width / 1.6,
            child: Image.network(
              product.pic!,
              fit: BoxFit.fill,
            )),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: product.name!,
                size: 30,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CustomText(
                              text: 'Size',
                              size: 20,
                            ),
                            CustomText(
                              text: product.size ?? '',
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CustomText(
                              text: 'Color',
                              size: 20,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: product.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const CustomText(
                text: 'Details',
                fontWeight: FontWeight.w400,
                size: 22,
              ),
              const SizedBox(height: 10),
              const CustomText(
                text:
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt, orci vel commodo mattis, nibh risus aliquam tellus, quis consequat metus elit et lectus. Sed mollis porttitor lacinia. Mauris viverra faucibus lorem, ac fermentum eros. Integer justo lacus, ultrices nec euismod nec, malesuada a turpis. Sed lobortis felis orci, nec congue arcu volutpat sit amet..''',
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    ));
  }

  Widget addToCartSection(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(color: Color(0xfffafafa), boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(1, 0), blurRadius: 5)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Price',
                    color: Colors.black38,
                    size: 26,
                    fontWeight: FontWeight.w300,
                  ),
                  CustomText(
                    text: '${product.price!.toString()} \$',
                    size: 24,
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(
                width: 170,
                height: 60,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    var cartProduct = CartProductModel(
                      id: product.id,
                      name: product.name,
                      image: product.pic,
                      quantity: 1,
                      price: product.price.toString(),
                    );

                    controller.addToCart(cartProduct);

                    Get.back();
                  },
                  color: primaryColor,
                  child: const CustomText(
                    text: 'Add to Cart',
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    size: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
