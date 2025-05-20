import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../features/booking/controllers/favorites_controller.dart';

class FavoriteIcon extends StatelessWidget {
  final String propertyId;

  const FavoriteIcon({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
            () => IconButton(
          icon:
          controller.isFavourite(propertyId)
              ? SvgPicture.asset(
            "assets/icons/custom_icons/favorited_heart.svg",
            height: 24, // Increase height on hover
          )
              : SvgPicture.asset(
            "assets/icons/custom_icons/unfavorited_heart.svg",
            height: 24, // Increase height on hover
          ),
          onPressed: () => controller.toggleFavouriteProduct(propertyId),
        ),
      );
  }
}
