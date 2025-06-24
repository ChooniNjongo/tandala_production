import 'package:cwt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../controllers/secondary_filter_controller.dart';
import '../common/quick_filter_item.dart';

class QuickFiltersMobile extends StatefulWidget {
  const QuickFiltersMobile({super.key});

  @override
  _QuickFiltersMobileState createState() => _QuickFiltersMobileState();
}

class _QuickFiltersMobileState extends State<QuickFiltersMobile> {
  final ScrollController _scrollController = ScrollController();
  bool _showChevron = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Hide chevron when scrolled to the end
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      final isAtEnd = currentScroll >= (maxScroll - 50); // 50px threshold

      if (_showChevron && isAtEnd) {
        setState(() {
          _showChevron = false;
        });
      } else if (!_showChevron && !isAtEnd) {
        setState(() {
          _showChevron = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecondaryFilterController());

    return TRoundedContainer(
      child: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasSwimmingPool,
                    ),
                    isActive: controller.hasSwimmingPool.value,
                    filterName: 'Swimming',
                    icon: TImages.swim,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasBedNBreakfast,
                    ),
                    isActive: controller.hasBedNBreakfast.value,
                    filterName: 'Bed & Breakfast',
                    icon: TImages.breakfast,
                  ),
                  SecondaryFilterItem(
                    onTap: () =>
                        controller.onFilterItemTapped(controller.hasBoat),
                    isActive: controller.hasBoat.value,
                    filterName: 'Boat',
                    icon: TImages.beach,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasWaterfront,
                    ),
                    isActive: controller.hasWaterfront.value,
                    filterName: 'Waterfront',
                    icon: TImages.boat,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasCountryside,
                    ),
                    isActive: controller.hasCountryside.value,
                    filterName: 'Countryside',
                    icon: TImages.countryside,
                  ),
                  SecondaryFilterItem(
                    onTap: () =>
                        controller.onFilterItemTapped(controller.inCity),
                    isActive: controller.inCity.value,
                    filterName: 'City',
                    icon: TImages.city,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasBalcony,
                    ),
                    isActive: controller.hasBalcony.value,
                    filterName: 'Balcony',
                    icon: TImages.balcony,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasParty,
                    ),
                    isActive: controller.hasParty.value,
                    filterName: 'Party',
                    icon: TImages.party,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasCabin,
                    ),
                    isActive: controller.hasCabin.value,
                    filterName: 'Cabin',
                    icon: TImages.cabin,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasCamping,
                    ),
                    isActive: controller.hasCamping.value,
                    filterName: 'Camping',
                    icon: TImages.camping,
                  ),
                  SecondaryFilterItem(
                    onTap: () => controller.onFilterItemTapped(
                      controller.hasConference,
                    ),
                    isActive: controller.hasConference.value,
                    filterName: 'Conference',
                    icon: TImages.conference,
                  ),
                  // Add some padding at the end to ensure last item is not hidden
                  const SizedBox(width: 60),
                ],
              ),
            ),
          ),

          // Chevron arrow overlay with gradient
          if (false)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 64, // Increased width to push arrow further right
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                    stops: const [0.0, 0.3, 1.0],
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight, // Align to the right edge
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0), // Small padding from edge
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: TColors.primaryBackground.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(TImages.chevron_right,height: 16,width: 16,),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}