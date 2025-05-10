import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_filter/filter_divider.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/room.dart';
import '../../../room_viewing/widgets/common/room_counts.dart';
import '../../../room_viewing/widgets/common/room_price.dart';

class BottomSheetRoomPreviewCard extends StatelessWidget {
  const BottomSheetRoomPreviewCard({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        Get.toNamed(TRoutes.roomViewing, arguments: room);
      },
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: TSizes.spaceBtwSections),
            /// Room Image Card
            Container(
              height: screenHeight * 0.3,
              width: isMobile ? screenWidth * 0.7 : screenWidth * 0.3,
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
              decoration: BoxDecoration(
                color: TColors.secondaryBackground2,
                borderRadius: BorderRadius.circular(12),
                image: room.bedAndBashBoardPictures.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(room.bedAndBashBoardPictures[0]),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: room.bedAndBashBoardPictures.isEmpty
                  ? const Center(
                      child: Text(
                        'No Image Available',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : null,
            ),

            /// Room Name
            Text(
              room.roomDescription,
              style: isMobile
                  ? TTypography.h3.copyWith(color: TColors.white, fontSize: 22)
                  : TTypography.h4.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height:
              isMobile ? TSizes.spaceBtwItems : TSizes.spaceBtwItems * 2,
            ),
            /// Room Counts and Price
            Column(
              children: [
                SizedBox(
                  height: isMobile
                      ? TSizes.spaceBtwItems / 2
                      : TSizes.spaceBtwItems,
                ),
                RoomCounts(room: room),
                SizedBox(
                  height: isMobile
                      ? TSizes.spaceBtwItems / 2
                      : TSizes.spaceBtwItems,
                ),
                RoomPrice(room: room),
              ],
            ),
            Visibility(visible: isMobile, child: const FilterDivider()),
          ],
        ),
      ),
    );
  }
}
