import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrchaseCompleting extends StatelessWidget {
  const PrchaseCompleting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SvgPicture.asset(
          'assets/images/agree.svg',
          height: 180,
        ),
        const SizedBox(height: 30),
        RichText(
          text: const TextSpan(
              text: 'Click on',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
              children: [
                TextSpan(
                  text: ' "Confirm"',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: ' Button,',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                )
              ]),
        ),
        const CustomText(
          text: 'to confirm your purchase',
          size: 18,
          fontWeight: FontWeight.w300,
        )
      ]),
    );
  }
}
