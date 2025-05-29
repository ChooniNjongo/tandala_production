import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/listing_model.dart';
import '../common/edit.dart';

class AboutListing extends StatelessWidget {
  const AboutListing({super.key, required this.listing, required this.isEditing});

  final ListingModel listing;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Padding(
      padding:  const EdgeInsets.all(
          TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listing.description,
            style:
                TTypography.body12Regular.copyWith(color: Colors.white.withOpacity(0.8)),
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          if(isEditing)
           Edit(label: 'edit about',onTap: (){
             Get.toNamed(TRoutes.description);
           },)
        ],
      ),
    );
  }
}
