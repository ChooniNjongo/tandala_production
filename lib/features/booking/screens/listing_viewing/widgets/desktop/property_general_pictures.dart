import 'package:cwt_ecommerce_admin_panel/features/booking/screens/listing_viewing/widgets/desktop/secondary_cascade_images.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/property/listing_model.dart';
import 'main_cascade_image.dart';

class PropertyGeneralPictures extends StatelessWidget {
  final ListingModel listing;

  const PropertyGeneralPictures({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: MainCascadeImage()),
        SizedBox(width: TSizes.spaceBtwItems / 2),
        Expanded(child: SecondaryCascadeImages()),
      ],
    );
  }
}
