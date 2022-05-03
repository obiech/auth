import 'package:fasta/colors/colors.dart';
import 'package:fasta/theming/size_config.dart';
import 'package:fasta/typography/text_styles.dart';
import 'package:flutter/material.dart';

class FirstOnboardingView extends StatelessWidget {
  const FirstOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1.screenHeight,
        width: 1.screenWidth,
        color: Colors.black,
        child: Stack(children: [
          Positioned(
              child: RichText(
            text: TextSpan(
                text: 'Your Everyday\n Logistics Made ',
                style: FastaTextStyle.headline1,
                children: [
                  TextSpan(
                      text: 'Easy',
                      style: FastaTextStyle.headline1
                          .copyWith(color: FastaColors.primary3))
                ]),
          )),
          Positioned(child: Image.asset('assets/world.png'))
        ]));
  }
}
