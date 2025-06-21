import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../controllers/secondary_filter_controller.dart';

class QuickFilters extends StatelessWidget {
  const QuickFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecondaryFilterController());
    return  Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SecondaryFilterItem(
            onTap:
                () => controller.onFilterItemTapped(
              controller.hasSwimmingPool,
            ),
            isActive: controller.hasSwimmingPool.value,
            filterName: 'Swimming', icon: TImages.swim,
          ),
          SecondaryFilterItem(
            onTap:
                () => controller.onFilterItemTapped(
              controller.hasBedNBreakfast,
            ),
            isActive: controller.hasBedNBreakfast.value,
            filterName: 'Bed & Breakfast', icon: TImages.breakfast,
          ),
          SecondaryFilterItem(
            onTap:
                () =>
                controller.onFilterItemTapped(controller.hasBoat),
            isActive: controller.hasBoat.value,
            filterName: 'Boat', icon: TImages.boat,
          ),
          SecondaryFilterItem(
            onTap:
                () => controller.onFilterItemTapped(
              controller.hasWaterfront,
            ),
            isActive: controller.hasWaterfront.value,
            filterName: 'Waterfront', icon:  TImages.beach,
          ),
          SecondaryFilterItem(
            onTap:
                () => controller.onFilterItemTapped(
              controller.hasCountryside,
            ),
            isActive: controller.hasCountryside.value,
            filterName: 'Countryside', icon: TImages.countryside,
          ),
          SecondaryFilterItem(
            onTap:
                () =>
                controller.onFilterItemTapped(controller.inCity),
            isActive: controller.inCity.value,
            filterName: 'City', icon: TImages.city,
          ),

          SecondaryFilterItem(
            onTap:
                () => controller.onFilterItemTapped(
              controller.hasCamping,
            ),
            isActive: controller.hasCamping.value,
            filterName: 'Camping', icon: TImages.camping,
          ),
          SecondaryFilterItem(
            onTap:
                () => controller.onFilterItemTapped(
              controller.hasConference,
            ),
            isActive: controller.hasConference.value,

            filterName: 'Conference', icon: TImages.conference,
          ),
        ],
      ),
    );
  }
}
