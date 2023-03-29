import 'package:e_commerce/core/model_view/auth_controller.dart';
import 'package:e_commerce/helper/extenstions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends GetWidget<AuthController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.black,
            onPressed: Get.back),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        spreadRadius: 1,
                        blurRadius: 8)
                  ]),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Sign Up,',
                      fontWeight: FontWeight.bold,
                      size: 34,
                    ),
                    const SizedBox(height: 50),
                    CustomTextFormField(
                      text: 'Name',
                      hintText: 'David spade',
                      onSaved: (name) {
                        controller.userName = name;
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                        text: 'Email',
                        hintText: 'iamdavid@gmail.com',
                        onSaved: (email) {
                          controller.email = email;
                        },
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please enter your email here.';
                          } else if (!email.isValidEmail()) {
                            return 'This email is invalid.';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      text: 'Password',
                      hintText: '•••••••••••',
                      onSaved: (password) {
                        controller.password = password;
                      },
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Please enter your email here.';
                        } else if (password.length < 6) {
                          return 'the password must contain 6 digits at least';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassowrd();
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
