import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/image_strings.dart';

class RightFrame extends StatelessWidget {
  const RightFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// List your property link
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: Row(
            children: [
              // Plus icon
              SvgPicture.asset(TImages.plus),
              const SizedBox(width: 8),
              // Listing text
              const Text(
                "List Your Property",
                style: TextStyle(
                  color: TColors.textPrimary,
                  fontFamily: 'InterDisplay',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 1.4,
                  letterSpacing: 0.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 80),
        SvgPicture.asset(TImages.notification),
        const SizedBox(width: 12),
        SvgPicture.asset(TImages.union),
        const SizedBox(width: 12),
        // Circular profile image with radius 48
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // replace with actual URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 24),
        SvgPicture.asset(TImages.menu),

      ],
    );
  }
}
