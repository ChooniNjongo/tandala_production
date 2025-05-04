import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/search_filter.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/mobile_search_icon_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../containers/rounded_container.dart';

class MobileHeader extends StatefulWidget {
  const MobileHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bounceAnimation;
  int _notificationCount = 9;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _bounceAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Optionally animate once on load
    triggerNotificationBounce();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void triggerNotificationBounce() async {
    try {
      await _animationController.forward();
      await _animationController.reverse();
    } catch (_) {}
  }

  void simulateNewNotification() {
    setState(() {
      _notificationCount++;
    });
    triggerNotificationBounce();
  }

  void showMobileFilter() {
    showModalBottomSheet(
      useSafeArea: true,
      barrierColor: TColors.lightGrey,
      backgroundColor: TColors.lightGrey,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const SearchFilter(),
        );
      },
    );
  }

  void showCompulsoryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: TColors.primaryBackground,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: const SearchFilter(),
        );
      },
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchIconVisibilityController = Get.put(MobileSearchIconController());

    return TRoundedContainer(
      showBorder: false,
      padding: const EdgeInsets.only(right: 32, left: 32, top: 12, bottom: 12),
      radius: 0,
      showShadow: false,
      height: 188,
      backgroundColor: TColors.primaryBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Logo
          Image.asset(
            TImages.logoPng,
            height: 56,
            width: 100,
          ),

          /// Search Icon
          TRoundedContainer(
            onTap: () {
              searchIconVisibilityController.onSearchIconTapped();
              if (TDeviceUtils.isMobileScreen(context)) {
                showMobileFilter();
              }
              if (TDeviceUtils.isDesktopScreen(context)) {
                showCompulsoryDialog();
              }
            },
            padding: const EdgeInsets.all(12),
            radius: 100,
            backgroundColor: TColors.secondaryBackground2,
            child: const Icon(
              Icons.search,
              color: TColorSystem.primary500,
              size: 32,
            ),
          ),

          /// Notification with Bounce
          AnimatedBuilder(
            animation: _bounceAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -_bounceAnimation.value),
                child: child,
              );
            },
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.notifications_outlined, size: 24),
                ),
                if (_notificationCount > 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '$_notificationCount',
                        style: const TextStyle(fontSize: 12,color: TColorSystem.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          /// Menu Icon (You can wrap this in GestureDetector if needed)
          GestureDetector(
            onTap:  () => widget.scaffoldKey?.currentState?.openDrawer() , // Test trigger
            child: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
