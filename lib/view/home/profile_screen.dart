import 'package:e_commerce/core/model_view/profile_controller.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: Get.put(ProfileController()),
      builder: (controller) => Scaffold(
        body: Column(children: [
          controller.loading
              ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
              : userData(controller.user),
          const SizedBox(height: 50),
          optionsListView(controller),
        ]),
      ),
    );
  }

  Widget userData(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(
              user.photo ??
                  'https://discoverytech.io/wp-content/uploads/2022/09/person-unknown.png',
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: user.name ?? '',
                size: 24,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 5),
              CustomText(
                text: user.email ?? '',
                size: 17,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox optionsListView(ProfileController controller) {
    Widget optionTile(Option option) {
      return InkWell(
        onTap: option.title == 'Log Out' ? () => controller.signOut() : () {},
        splashColor: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Image.asset(option.image!, height: 50),
            title: CustomText(
              text: option.title!,
              size: 20,
              fontWeight: FontWeight.w300,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 450,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => optionTile(options[index]),
        itemCount: options.length,
      ),
    );
  }

  List<Option> options = [
    Option(
        image: 'assets/images/home/Icon_Edit-Profile.png',
        title: 'Edit Profile'),
    Option(
        image: 'assets/images/home/Icon_Location.png',
        title: 'Shipping Address'),
    Option(
      image: 'assets/images/home/Icon_History.png',
      title: 'Order History',
    ),
    Option(
      image: 'assets/images/home/Icon_Payment.png',
      title: 'Cards',
    ),
    Option(
      image: 'assets/images/home/Icon_Alert.png',
      title: 'Notifications',
    ),
    Option(
      image: 'assets/images/home/Icon_Exit.png',
      title: 'Log Out',
    ),
  ];
}

class Option {
  String? image;
  String? title;
  Function()? onTap;
  Option({this.image, this.title, this.onTap});
}
