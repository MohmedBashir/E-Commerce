import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/model_view/home_controller.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          builder: (controller) => SafeArea(child: controller.selectedScreen)),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return SizedBox(
      height: 85,
      child: GetBuilder<HomeController>(
        builder: (controller) => BottomNavigationBar(
          onTap: (value) => controller.onTapBottomNavBar(value),
          currentIndex: controller.selectedBotoomNavBar,
          elevation: 2,
          items: [
            BottomNavigationBarItem(
                activeIcon: Column(
                  children: const [
                    CustomText(
                      text: 'Explore',
                      size: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    CustomText(
                      text: '•',
                      size: 20,
                      color: primaryColor,
                    )
                  ],
                ),
                icon: Image.asset('assets/images/home/Icon_Explore.png',
                    height: 25),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Column(
                  children: const [
                    CustomText(
                      text: 'Cart',
                      size: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    CustomText(
                      text: '•',
                      size: 20,
                      color: primaryColor,
                    )
                  ],
                ),
                icon:
                    Image.asset('assets/images/home/Icon_Cart.png', height: 25),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Column(
                  children: const [
                    CustomText(
                      text: 'Profile',
                      size: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    CustomText(
                      text: '•',
                      size: 20,
                      color: primaryColor,
                    )
                  ],
                ),
                icon:
                    Image.asset('assets/images/home/Icon_User.png', height: 25),
                label: ''),
          ],
        ),
      ),
    );
  }
}
