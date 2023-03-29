import 'package:e_commerce/core/model_view/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../model/cart_product_model.dart';
import '../constants.dart';
import '../internal screen/checkout screen/checkout_screen.dart';
import '../widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => controller.cartProductsList.isEmpty
          ? emptyCart()
          : controller.loading.value
              ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
              : Scaffold(
                  body: Stack(
                  children: [
                    cartListView(controller),
                    checkoutSection(context, controller),
                  ],
                )),
    );
  }

  Stack emptyCart() {
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/empty-cart.svg',
              height: 200,
              colorFilter: ColorFilter.mode(
                  const Color(0xfffafafa).withOpacity(0.7), BlendMode.dstATop),
            ),
            const SizedBox(height: 40),
            const CustomText(
              text: 'Cart is empty right now !',
              size: 25,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'Click on  ',
                  size: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),
                Image.asset(
                  'assets/images/home/Icon_Explore.png',
                  height: 25,
                ),
                const CustomText(
                  text: '  to explore our products.',
                  size: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  Column cartListView(CartController controller) {
    Widget cartItem(CartProductModel product) {
      GlobalKey key = GlobalKey();
      return Dismissible(
        onDismissed: (direction) {
          controller.deleteFromCart(product.id!);
        },
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.network(product.image!),
              ),
              const SizedBox(width: 25),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(
                  text: product.name!,
                  size: 21,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: '${product.price.toString()} \$',
                  size: 20,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5))),
                        child: const Icon(Icons.add),
                      ),
                      onTap: () {
                        controller.quantityIncrease(product);
                      },
                    ),
                    const SizedBox(width: 1),
                    Container(
                        height: 40,
                        width: 40,
                        color: Colors.black12,
                        child: Center(
                          child: CustomText(
                            text: product.quantity.toString(),
                            size: 22,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                    const SizedBox(width: 1),
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: const Icon(Icons.remove),
                      ),
                      onTap: () {
                        controller.quantityDecrease(product);
                      },
                    ),
                  ],
                )
              ])
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                cartItem(controller.cartProductsList[index]),
            itemCount: controller.cartProductsList.length,
          ),
        ),
        const SizedBox(height: 100)
      ],
    );
  }

  Align checkoutSection(BuildContext context, CartController controller) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(color: Color(0xfffafafa), boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(1, 0), blurRadius: 5)
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
                  text: '${controller.totalPrice} \$',
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
                  Get.to(const CheckoutScreen());
                },
                color: primaryColor,
                child: const CustomText(
                  text: 'Checkout',
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
