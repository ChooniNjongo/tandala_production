import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/layouts/headers/mobile_header.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../controllers/secondary_filter_controller.dart';
import '../common/quick_filter_item.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.put(SecondaryFilterController());
    // GetX MenuController
    return SliverAppBar(
      title: const MobileHeader(),
      automaticallyImplyLeading: false,
      // Remove back arrow
      leading: null,
      // Explicitly set leading to null
      expandedHeight: 124.0,
      titleSpacing: 0.0,
      floating: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 0),
        expandedTitleScale: 1.1,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Swimming Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasSwimmingPool,
                  ),
                  isActive: filterController.hasSwimmingPool.value,
                  activeIcon: TImages.swimming_active,
                  inactiveIcon: TImages.swimming_inactive,
                  border: TColors.swimmingActive,
                  filterName: 'Swimming',
                ),
                // Bed & Breakfast Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasBedNBreakfast,
                  ),
                  isActive: filterController.hasBedNBreakfast.value,
                  activeIcon: TImages.breakfastActive,
                  inactiveIcon: TImages.breakfastInactive,
                  border: TColors.breakfastActive,
                  filterName: 'Bed & Breakfast',
                ),
                // Boat Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasBoat,
                  ),
                  isActive: filterController.hasBoat.value,
                  activeIcon: TImages.boat_active,
                  inactiveIcon: TImages.boat_inactive,
                  border: TColors.boatActive,
                  filterName: 'Boat',
                ),
                // Waterfront Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasWaterfront,
                  ),
                  isActive: filterController.hasWaterfront.value,
                  activeIcon: TImages.waterfrontActive,
                  inactiveIcon: TImages.waterfront_inactive,
                  border: TColors.waterfrontActive,
                  filterName: 'Waterfront',
                ),
                // Countryside Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasCountryside,
                  ),
                  isActive: filterController.hasCountryside.value,
                  activeIcon: TImages.countryside_active,
                  inactiveIcon: TImages.countryside_inactive,
                  border: TColors.countrySideActive,
                  filterName: 'Countryside',
                ),
                // City Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.inCity,
                  ),
                  isActive: filterController.inCity.value,
                  activeIcon: TImages.city_active,
                  inactiveIcon: TImages.city_inactive,
                  border: TColors.cityActive,
                  filterName: 'City',
                ),
                // Balcony Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasBalcony,
                  ),
                  isActive: filterController.hasBalcony.value,
                  activeIcon: TImages.balconyActive,
                  inactiveIcon: TImages.balconyInactive,
                  border: TColors.balconyActive,
                  filterName: 'Balcony',
                ),
                // Party Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasParty,
                  ),
                  isActive: filterController.hasParty.value,
                  activeIcon: TImages.party_active,
                  inactiveIcon: TImages.party_inactive,
                  border: TColors.partyActive,
                  filterName: 'Party',
                ),
                // Cabin Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasCabin,
                  ),
                  isActive: filterController.hasCabin.value,
                  activeIcon: TImages.cabin_active,
                  inactiveIcon: TImages.cabin_inactive,
                  border: TColors.cabinActive,
                  filterName: 'Cabin',
                ),
                // Camping Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasCamping,
                  ),
                  isActive: filterController.hasCamping.value,
                  activeIcon: TImages.campingActive,
                  inactiveIcon: TImages.camping_inactive,
                  border: TColors.campingActive,
                  filterName: 'Camping',
                ),
                // Conference Filter
                SecondaryFilterItem(
                  onTap: () => filterController.onFilterItemTapped(
                    filterController.hasConference,
                  ),
                  isActive: filterController.hasConference.value,
                  activeIcon: TImages.conference_active,
                  inactiveIcon: TImages.conference_inactive,
                  border: TColors.conferenceActive,
                  filterName: 'Conference',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
