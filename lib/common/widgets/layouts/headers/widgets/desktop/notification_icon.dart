import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/image_strings.dart';

class TNotificationIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const TNotificationIcon({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
        print("Notification clicked");
        // Add your navigation or action logic
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
              child: SvgPicture.asset(TImages.notification),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFDC3545),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}