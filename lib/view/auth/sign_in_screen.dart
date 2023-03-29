import 'package:e_commerce/core/model_view/auth_controller.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../widgets/custom_sign_in_method.dart';
import 'sign_up_screen.dart';

class SignInScreen extends GetWidget<AuthController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                        padding: const EdgeInsets.all(15),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CustomText(
                                  text: 'Welcome,',
                                  fontWeight: FontWeight.bold,
                                  size: 34,
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () => Get.to(const SignUpScreen()),
                                  child: const CustomText(
                                    text: 'Sign Up',
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                            const CustomText(
                              text: 'Sign in to Continue',
                              color: Colors.black54,
                            ),
                            const SizedBox(height: 50),
                            CustomTextFormField(
                              text: 'Email',
                              hintText: 'example@gmail.com',
                              onSaved: (value) {
                                controller.email = value!;
                              },
                              validator: (email) {
                                if (email!.isEmpty) {
                                  return 'Please enter your email here.';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 25),
                            CustomTextFormField(
                              text: 'Password',
                              hintText: '•••••••••••',
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return 'Please enter your password here.';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 25),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const CustomText(
                                      text: 'Forgot Password?')),
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: 'Sign In',
                              onPressed: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                  controller.signInWithEmailAndPassword();
                                }
                              },
                            )
                          ],
                        )),
                  ),
                  const SizedBox(height: 25),
                  const Text('-OR-'),
                  const SizedBox(height: 25),
                  CustomSignInMethod(
                    text: 'Sign In with Facebook',
                    image: 'assets/images/auth/facebookIcon.png',
                    onPressed: () {
                      controller.facebookSignIn();
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomSignInMethod(
                    text: 'Sign In with Google',
                    image: 'assets/images/auth/googleIcon.png',
                    onPressed: () {
                      controller.googleSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
