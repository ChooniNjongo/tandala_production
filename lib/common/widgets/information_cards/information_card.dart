import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/sizes.dart';
import '../containers/rounded_container.dart';
import '../question_container/question_container.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({
    super.key,
    this.svgImage = "assets/images/on_boarding_images/interest_hero.svg",
    this.padding = const EdgeInsets.all(32),
    this.margin = const EdgeInsets.all(24),
    this.imageHeight = 180,
    required this.question,
    required this.body,
    this.cardColor = Colors.transparent,
  });

  final String svgImage;
  final String question;
  final String body;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? imageHeight;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      radius: 10,
      backgroundColor: cardColor,
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Svg Image
          SvgPicture.asset(
            svgImage,
            height: imageHeight,
          ),
          // Sized box of height 24
          const SizedBox(
            height: 12,
          ),
          // Question container
          QuestionContainer(
            question: question,
            body: body,
          ),
          // Sized box of height 24
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: TSizes.buttonWidth,
            child: ElevatedButton(
              onPressed: (){},
              child: Text( 'buttonLabel'),
            ),
          ),
        ],
      ),
    );
  }
}
