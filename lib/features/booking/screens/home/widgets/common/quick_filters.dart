import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../controllers/secondary_filter_controller.dart';

class QuickFilters extends StatelessWidget {
  const QuickFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecondaryFilterController());
    return Row(
      children: [
        SecondaryFilterItem(
          onTap: () =>
              controller.onFilterItemTapped(controller.hasSwimmingPool),
          isActive: controller.hasSwimmingPool.value,
          icon: TImages.swim,
          filterName: 'Swimming',
        ),
        SecondaryFilterItem(
          onTap: () =>
              controller.onFilterItemTapped(controller.hasBedNBreakfast),
          isActive: controller.hasBedNBreakfast.value,
          icon: TImages.breakfast,
          filterName: 'Bed & Breakfast',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasBoat),
          isActive: controller.hasBoat.value,
          icon: TImages.boat,
          filterName: 'Boat',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasWaterfront),
          isActive: controller.hasWaterfront.value,
          icon: TImages.beach,
          filterName: 'Waterfront',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasCountryside),
          isActive: controller.hasCountryside.value,
          icon: TImages.countryside,
          filterName: 'Countryside',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.inCity),
          isActive: controller.inCity.value,
          icon: TImages.city,
          filterName: 'City',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasBalcony),
          isActive: controller.hasBalcony.value,
          icon: TImages.balcony,
          filterName: 'Balcony',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasParty),
          isActive: controller.hasParty.value,
          icon: TImages.party,
          filterName: 'Party',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasCabin),
          isActive: controller.hasCabin.value,
          icon: TImages.cabin,
          filterName: 'Cabin',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasCamping),
          isActive: controller.hasCamping.value,
          icon: TImages.camping,
          filterName: 'Camping',
        ),
        SecondaryFilterItem(
          onTap: () => controller.onFilterItemTapped(controller.hasConference),
          isActive: controller.hasConference.value,
          icon: TImages.conference,
          filterName: 'Conference',
        ),
      ],
    );
  }
}
