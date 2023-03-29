import 'package:e_commerce/core/model_view/checkout_controller.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      builder: (controller) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: CustomText(
              text: 'Add Your Address',
              size: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 400,
              child: Column(
                children: [
                  const CustomTextFormField(
                    text: 'Street 1',
                    hintText: '21, Alex Davidson Avenue',
                  ),
                  const SizedBox(height: 10),
                  const CustomTextFormField(
                    text: 'Street 2',
                    hintText: 'Opposite Omegatron, Vicent Quarters',
                  ),
                  const SizedBox(height: 10),
                  const CustomTextFormField(
                    text: 'City',
                    hintText: 'Victoria Island',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Expanded(
                        child: CustomTextFormField(
                          text: 'State',
                          hintText: 'Lagos State',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomTextFormField(
                          text: 'Country',
                          hintText: 'Nigeria',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: controller.checkboxValue,
                          onChanged: (value) {
                            controller.changecheckboxValue(value);
                          },
                          shape: const CircleBorder(),
                        ),
                      ),
                      const CustomText(
                        text: 'Billing address is the same as delivery address',
                        size: 14.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
