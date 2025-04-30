import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/search_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../utils/constants/typography.dart';
import '../../../../../../../utils/device/device_utility.dart';
import '../../../../../containers/rounded_container.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../search_bar/search_bar.dart';

class SearchAndFilters extends StatelessWidget {
  const SearchAndFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // compulsory dialog function
    final isMobile = TDeviceUtils.isMobileScreen(context);

    void showMobileFilter() {
      showModalBottomSheet(
        useSafeArea: true,
        barrierColor: TColors.lightGrey,
        backgroundColor: TColors.lightGrey,
        context: context,
        isScrollControlled: true,
        // Allows the sheet to expand fully
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), // Curve for the top-left corner
            topRight: Radius.circular(16), // Curve for the top-right corner
            bottomLeft: Radius.zero, // Straight bottom-left corner
            bottomRight: Radius.zero, // Straight bottom-right corner
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
              backgroundColor: TColors.dark,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              content: const SearchFilter(),
            );
          },
          barrierDismissible: true);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TSearchBar(),
        SizedBox(
          width: isMobile ? TSizes.spaceBtwItems / 6 : TSizes.spaceBtwItems,
        ),
        TRoundedContainer(
          padding: const EdgeInsets.all(4),
          onTap: () {
            if (TDeviceUtils.isMobileScreen(context)) {
              showMobileFilter();
            }
            if (TDeviceUtils.isDesktopScreen(context)) {
              showCompulsoryDialog();
            }
          },
          margin: const EdgeInsets.symmetric(horizontal: 12),
          radius: 4,
          showBorder: true,
          borderColor: TColors.iconBorder,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/custom_icons/icon_family/material-symbols-light_tune.svg",
                color: TColors.textIconFilterInactive,
              ),
              if (!isMobile)
                Text("Filters",
                    style: TTypography.body12Regular.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textIconFilterInactive)),
            ],
          ),
        ),
      ],
    );
  }
}
