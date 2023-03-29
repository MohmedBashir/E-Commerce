import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSignInMethod extends StatelessWidget {
  final String text;
  final String image;
  final Function() onPressed;
  const CustomSignInMethod({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Center(
          child: Row(
            children: [
              Image.asset(
                image,
                height: 25,
                width: 25,
              ),
              const SizedBox(
                width: 40,
              ),
              CustomText(text: text)
            ],
          ),
        ),
      ),
    );
  }
}
