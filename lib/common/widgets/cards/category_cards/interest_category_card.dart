import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../containers/rounded_container.dart';

class InterestProductCategoryCard extends StatelessWidget {
  const InterestProductCategoryCard({
    super.key,
    required this.cardLabel,
    required this.image,
    this.onTap,
    this.icon = TImages.chevronCategoryCard,
  });

  final String cardLabel;
  final String image;
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      radius: 10,
      backgroundColor: Colors.purpleAccent.withOpacity(0.05),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.zero,
      height: 165,
      width: 163,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Card Label
          Text(
            cardLabel,
            style: const TextStyle(
              fontFamily: "Lora",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: TColorSystem.n200,
              height: 23 / 18,
            ),
            textAlign: TextAlign.left,
          ),

          const SizedBox(
            height: 8,
          ),
          // Image
          const Spacer(),
          const SizedBox(
            height: 8,
          ),
          //Action Button
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: SvgPicture.asset(
                icon,
                color: Colors.white,
                height: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
