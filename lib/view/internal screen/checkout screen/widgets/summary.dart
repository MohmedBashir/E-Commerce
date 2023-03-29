import 'package:e_commerce/core/model_view/cart_controller.dart';
import 'package:e_commerce/core/model_view/checkout_controller.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/view/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Summary extends StatelessWidget {
  Summary({super.key});

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CustomText(
                text: 'Summary ',
                size: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            productsListView(cartController),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(thickness: 1.5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Shipping Address',
                      size: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      text: controller.shippingAddress,
                      fontWeight: FontWeight.w300,
                    ),
                    TextButton(
                        onPressed: () {
                          controller.previousStep();
                        },
                        child: const CustomText(
                          text: 'Change',
                          color: primaryColor,
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget productsListView(CartController controller) {
    Widget productListTile(CartProductModel product) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              product.image!,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
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
            text: '\$ ${product.price!}',
            color: Colors.green,
            size: 18,
            fontWeight: FontWeight.w400,
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 210,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                productListTile(controller.cartProductsList[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: controller.cartProductsList.length),
      ),
    );
  }
}
