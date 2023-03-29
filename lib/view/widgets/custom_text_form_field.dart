import 'package:e_commerce/core/model_view/auth_controller.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends GetWidget<AuthController> {
  final String text;
  final String hintText;
  final Function(String?)? onSaved;
  final Function(String?)? onCanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      required this.text,
      required this.hintText,
      this.onSaved,
      this.onCanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          color: Colors.black87,
        ),
        TextFormField(
          obscureText: text == 'Password' ? true : false,
          style: const TextStyle(fontSize: 20),
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        )
      ],
    );
  }
}
