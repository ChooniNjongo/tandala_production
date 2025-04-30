import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../controllers/secondary_filter_controller.dart';

class SecondaryFilters extends StatefulWidget {
  const SecondaryFilters({super.key});

  @override
  _SecondaryFiltersState createState() => _SecondaryFiltersState();
}

class _SecondaryFiltersState extends State<SecondaryFilters> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 400,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 400,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = TDeviceUtils.isDesktopScreen(context);
    final controller = Get.put(SecondaryFilterController());
    return TRoundedContainer(
      elevation: isDesktop ? 0 : 4,
      margin: EdgeInsets.all(isDesktop ? 12 : 0),
      padding: EdgeInsets.all(isDesktop ? 12 : 0),
      radius: 8,
      showShadow: false,
      showBorder: isDesktop ? true : false,
      borderColor: TColors.iconBorder,
      child: Row(
        children: [
          /// Backward Arrow
          Visibility(
            visible: isDesktop,
            child: TRoundedContainer(
              //   backgroundColor: Colors.transparent,
              showBorder: true,
              borderWidth: 1,
              borderColor: TColors.borderPrimaryDark,
              radius: 40,
              padding: EdgeInsets.zero,
              showShadow: false,
              child: IconButton(
                icon: SvgPicture.asset(TImages.light_chevron_backward,
                    height: 24, semanticsLabel: 'Logo'),
                onPressed: _scrollLeft,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasSwimmingPool),
                      isActive: controller.hasSwimmingPool.value,
                      activeIcon: TImages.swimming_active,
                      inactiveIcon: TImages.swimming_inactive,
                      border: TColors.swimmingActive,
                      filterName: 'Swimming',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasBedNBreakfast),
                      isActive: controller.hasBedNBreakfast.value,
                      activeIcon: TImages.breakfastActive,
                      inactiveIcon: TImages.breakfastInactive,
                      border: TColors.breakfastActive,
                      filterName: 'Bed & Breakfast',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasBoat),
                      isActive: controller.hasBoat.value,
                      activeIcon: TImages.boat_active,
                      inactiveIcon: TImages.boat_inactive,
                      border: TColors.boatActive,
                      filterName: 'Boat',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasWaterfront),
                      isActive: controller.hasWaterfront.value,
                      activeIcon: TImages.waterfrontActive,
                      inactiveIcon: TImages.waterfront_inactive,
                      border: TColors.waterfrontActive,
                      filterName: 'Waterfront',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasCountryside),
                      isActive: controller.hasCountryside.value,
                      activeIcon: TImages.countryside_active,
                      inactiveIcon: TImages.countryside_inactive,
                      border: TColors.countrySideActive,
                      filterName: 'Countryside',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.inCity),
                      isActive: controller.inCity.value,
                      activeIcon: TImages.city_active,
                      inactiveIcon: TImages.city_inactive,
                      border: TColors.cityActive,
                      filterName: 'City',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasBalcony),
                      isActive: controller.hasBalcony.value,
                      activeIcon: TImages.balconyActive,
                      inactiveIcon: TImages.balconyInactive,
                      border: TColors.balconyActive,
                      filterName: 'Balcony',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasParty),
                      isActive: controller.hasParty.value,
                      activeIcon: TImages.party_active,
                      inactiveIcon: TImages.party_inactive,
                      border: TColors.partyActive,
                      filterName: 'Party',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasCabin),
                      isActive: controller.hasCabin.value,
                      activeIcon: TImages.cabin_active,
                      inactiveIcon: TImages.cabin_inactive,
                      border: TColors.cabinActive,
                      filterName: 'Cabin',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasCamping),
                      isActive: controller.hasCamping.value,
                      activeIcon: TImages.campingActive,
                      inactiveIcon: TImages.camping_inactive,
                      border: TColors.campingActive,
                      filterName: 'Camping',
                    ),
                    SecondaryFilterItem(
                      onTap: () => controller
                          .onFilterItemTapped(controller.hasConference),
                      isActive: controller.hasConference.value,
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

          /// Forward Arrow
          Visibility(
            visible: isDesktop,
            child: TRoundedContainer(
              //  backgroundColor: Colors.transparent,
              showBorder: true,
              borderWidth: 1,
              borderColor: TColors.borderPrimaryDark,
              radius: 40,
              padding: EdgeInsets.zero,
              showShadow: false,
              child: IconButton(
                icon: SvgPicture.asset(TImages.light_chevron_forward,
                    height: 24, semanticsLabel: 'Logo'),
                onPressed: _scrollRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
