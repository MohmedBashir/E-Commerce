import 'package:e_commerce/core/model_view/checkout_controller.dart';
import 'package:e_commerce/view/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: CustomText(
                text: 'Select the Delivary Type',
                size: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            RadioListTile<Delivary>(
              value: Delivary.standard,
              groupValue: controller.delivary,
              onChanged: (value) {
                controller.setDelivary(value!);
              },
              title: const CustomText(
                text: 'Standard Delivery',
                size: 22,
              ),
              subtitle: const CustomText(
                text: 'Order will be delivered between 3 - 5 business days',
                size: 18,
                fontWeight: FontWeight.w300,
              ),
              activeColor: primaryColor,
            ),
            const SizedBox(height: 30),
            RadioListTile<Delivary>(
              value: Delivary.nextDay,
              groupValue: controller.delivary,
              onChanged: (value) {
                controller.setDelivary(value!);
              },
              title: const CustomText(
                text: 'Next Day Delivery',
                size: 22,
              ),
              subtitle: const CustomText(
                text:
                    'Place your order before 6 pm and your items will be delivered the next day',
                size: 18,
                fontWeight: FontWeight.w300,
              ),
              activeColor: primaryColor,
            ),
            const SizedBox(height: 30),
            RadioListTile<Delivary>(
              value: Delivary.nominated,
              groupValue: controller.delivary,
              onChanged: (value) {
                controller.setDelivary(value!);
              },
              title: const CustomText(
                text: 'Nominated Delivery',
                size: 22,
              ),
              subtitle: const CustomText(
                text:
                    'Pick a particular date from the calendar and order will be delivered on selected date',
                size: 18,
                fontWeight: FontWeight.w300,
              ),
              activeColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
