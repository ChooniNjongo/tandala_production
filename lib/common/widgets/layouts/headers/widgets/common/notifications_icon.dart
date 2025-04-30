import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/constants/image_strings.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../../features/booking/controllers/notifications_icon_controller.dart';
import '../../../../../../utils/constants/color_system.dart';

class NotificationsIcon extends StatelessWidget {
  const NotificationsIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsIconController());
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => controller.notificationIconOnTap(),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(
              dark ? TImages.notificationLight : TImages.notificationLight,
              color: TColorSystem.n200,
              //height: 21,
              semanticsLabel: 'Notification Dark'),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Visibility(
            visible: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              // Adjust the radius as needed
              child: Container(
                color: Colors.red.withOpacity(1),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                  child: Text(
                    "8",
                    style: Theme.of(context).textTheme.labelSmall!.apply(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
