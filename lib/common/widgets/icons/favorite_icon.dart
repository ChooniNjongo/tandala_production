import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/booking/controllers/favorites_controller.dart';

class FavoriteIcon extends StatelessWidget {
  final String propertyId;

  const FavoriteIcon({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Positioned(
      top: 4,
      right: 2,
      child: Obx(
            () => IconButton(
          icon: Icon(
            Icons.favorite,
            color: controller.isFavourite(propertyId)
                ? Colors.redAccent.withAlpha(204)     // 0.8 * 255 ≈ 204
                : Colors.blueGrey.withAlpha(204),
          ),
          onPressed: () => controller.toggleFavouriteProduct(propertyId),
        ),
      ),
    );
  }
}
