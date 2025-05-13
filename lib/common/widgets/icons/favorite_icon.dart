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
    return Positioned(
      top: 4,
      right: 2,
      child: Obx(
        () => IconButton(
          icon:
              controller.isFavourite(propertyId)
                  ? Icon(Icons.favorite,color: Colors.redAccent.withOpacity(0.5),)
                  : Icon(Icons.favorite,color: Colors.blueGrey.withOpacity(.5),),
          onPressed: () => controller.toggleFavouriteProduct(propertyId),
        ),
      ),
    );
  }
}
