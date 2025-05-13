import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;


  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        unratedColor: TColorSystem.n600,
        rating: rating,
        itemSize: 20,
        itemBuilder: (_, __) => const Icon(Iconsax.star1,color: TColors.primary500 ,));
  }
}