import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../controllers/secondary_filter_controller.dart';

class QuickFilters extends StatefulWidget {
  const QuickFilters({
    super.key,
  });

  @override
  State<QuickFilters> createState() => _QuickFiltersState();
}

class _QuickFiltersState extends State<QuickFilters>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final List<bool> _isVisible = [];

  @override
  void initState() {
    super.initState();

    // Initialize visibility list - all items start as invisible
    for (int i = 0; i < 14; i++) {
      _isVisible.add(false);
    }

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    // Start the staggered animation
    _startStaggeredAnimation();
  }

  void _startStaggeredAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));

    for (int i = 0; i < _isVisible.length; i++) {
      if (mounted) {
        setState(() {
          _isVisible[i] = true;
        });
        await Future.delayed(const Duration(milliseconds: 80));
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedFilterItem({
    required int index,
    required VoidCallback onTap,
    required RxBool isActive,
    required String icon,
    required String filterName,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      transform: Matrix4.translationValues(
          _isVisible[index] ? 0 : 100,
          0,
          0
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _isVisible[index] ? 1.0 : 0.0,
        child: SecondaryFilterItem(
          onTap: onTap,
          isActive: isActive.value,
          icon: icon,
          filterName: filterName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecondaryFilterController());

    return Row(
      children: [
        _buildAnimatedFilterItem(
          index: 0,
          onTap: () => controller.onFilterItemTapped(controller.hasSwimmingPool),
          isActive: controller.hasSwimmingPool,
          icon: TImages.apartment,
          filterName: 'Apartments',
        ),
        _buildAnimatedFilterItem(
          index: 1,
          onTap: () => controller.onFilterItemTapped(controller.hasBedNBreakfast),
          isActive: controller.hasBedNBreakfast,
          icon: TImages.hotel,
          filterName: 'Hotel',
        ),
        _buildAnimatedFilterItem(
          index: 2,
          onTap: () => controller.onFilterItemTapped(controller.hasSwimmingPool),
          isActive: controller.hasSwimmingPool,
          icon: TImages.lodge,
          filterName: 'Lodges',
        ),
        _buildAnimatedFilterItem(
          index: 3,
          onTap: () => controller.onFilterItemTapped(controller.hasSwimmingPool),
          isActive: controller.hasSwimmingPool,
          icon: TImages.swim,
          filterName: 'Swimming',
        ),
        _buildAnimatedFilterItem(
          index: 4,
          onTap: () => controller.onFilterItemTapped(controller.hasBedNBreakfast),
          isActive: controller.hasBedNBreakfast,
          icon: TImages.breakfast,
          filterName: 'Bed & Breakfast',
        ),
        _buildAnimatedFilterItem(
          index: 5,
          onTap: () => controller.onFilterItemTapped(controller.hasBoat),
          isActive: controller.hasBoat,
          icon: TImages.boat,
          filterName: 'Boat',
        ),
        _buildAnimatedFilterItem(
          index: 6,
          onTap: () => controller.onFilterItemTapped(controller.hasWaterfront),
          isActive: controller.hasWaterfront,
          icon: TImages.beach,
          filterName: 'Waterfront',
        ),
        _buildAnimatedFilterItem(
          index: 7,
          onTap: () => controller.onFilterItemTapped(controller.hasCountryside),
          isActive: controller.hasCountryside,
          icon: TImages.countryside,
          filterName: 'Countryside',
        ),
        _buildAnimatedFilterItem(
          index: 8,
          onTap: () => controller.onFilterItemTapped(controller.inCity),
          isActive: controller.inCity,
          icon: TImages.city,
          filterName: 'City',
        ),
        _buildAnimatedFilterItem(
          index: 9,
          onTap: () => controller.onFilterItemTapped(controller.hasBalcony),
          isActive: controller.hasBalcony,
          icon: TImages.balcony,
          filterName: 'Balcony',
        ),
        _buildAnimatedFilterItem(
          index: 10,
          onTap: () => controller.onFilterItemTapped(controller.hasParty),
          isActive: controller.hasParty,
          icon: TImages.party,
          filterName: 'Party',
        ),
        _buildAnimatedFilterItem(
          index: 11,
          onTap: () => controller.onFilterItemTapped(controller.hasCabin),
          isActive: controller.hasCabin,
          icon: TImages.cabin,
          filterName: 'Cabin',
        ),
        _buildAnimatedFilterItem(
          index: 12,
          onTap: () => controller.onFilterItemTapped(controller.hasCamping),
          isActive: controller.hasCamping,
          icon: TImages.camping,
          filterName: 'Camping',
        ),
        _buildAnimatedFilterItem(
          index: 13,
          onTap: () => controller.onFilterItemTapped(controller.hasConference),
          isActive: controller.hasConference,
          icon: TImages.conference,
          filterName: 'Conference',
        ),
      ],
    );
  }
}