import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../features/booking/controllers/favorites_controller.dart';
import '../../../utils/constants/image_strings.dart';

class FavoriteIcon extends StatelessWidget {
  final String propertyId;

  const FavoriteIcon({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Obx(
      () => GestureDetector(
        onTap: () => controller.toggleFavouriteProduct(propertyId),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white, // optional: change to transparent or other
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(4.7),
          child: controller.isFavourite(propertyId)
              ? SvgPicture.asset(
                  "assets/icons/custom_icons/favorited_heart.svg",

                )
              : SvgPicture.asset(
                  TImages.union,
                  color: TColors.primaryBackground,
                ),
        ),
      ),
    );
  }
}
