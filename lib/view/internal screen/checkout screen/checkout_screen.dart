import 'package:e_commerce/core/model_view/checkout_controller.dart';
import 'package:e_commerce/core/model_view/home_controller.dart';
import 'package:e_commerce/view/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:steps_indicator/steps_indicator.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<CheckoutController>(
        init: CheckoutController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const CustomText(
                  text: 'Checkout',
                  size: 26,
                  fontWeight: FontWeight.w300,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          Get.back();
                        }),
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stepperSection(controller.selectedStep, width, controller),
                  controller.body,
                  previousNextSection(context, controller)
                ],
              ),
            ));
  }

  Widget previousNextSection(
      BuildContext context, CheckoutController controller) {
    HomeController homeController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: controller.selectedStep == 3
          ? SizedBox(
              width: double.infinity,
              height: 60,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  homeController.onTapBottomNavBar(0);
                  Get.back();
                },
                color: primaryColor,
                child: const CustomText(
                  text: 'Confirm',
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  size: 24,
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.2, color: primaryColor)),
                  child: SizedBox(
                    width: 170,
                    height: 60,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        controller.previousStep();
                      },
                      color: Colors.white,
                      child: const CustomText(
                        text: 'Previous',
                        color: primaryColor,
                        fontWeight: FontWeight.w300,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 60,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      controller.nextStep();
                    },
                    color: primaryColor,
                    child: const CustomText(
                      text: 'Next',
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget stepperSection(
      int selectedStep, double width, CheckoutController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          StepsIndicator(
            selectedStep: selectedStep,
            doneLineColor: primaryColor,
            undoneLineColor: Colors.black12,
            selectedStepColorOut: primaryColor,
            doneStepColor: primaryColor,
            unselectedStepColorIn: Colors.black12,
            unselectedStepColorOut: Colors.black12,
            selectedStepBorderSize: 2,
            doneLineThickness: 3,
            undoneLineThickness: 1,
            nbSteps: 3,
            doneStepSize: 30,
            selectedStepSize: 25,
            unselectedStepSize: 20,
            lineLength: width / 3,
            enableLineAnimation: true,
            enableStepAnimation: true,
          ),
        ],
      ),
    );
  }
}
