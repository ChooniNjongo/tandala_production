import 'package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/desktop/widgets/property_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../containers/rounded_container.dart';
import '../../image_sliders/home_property_image_slider.dart';

class TPropertyCardVertical extends StatefulWidget {
  const TPropertyCardVertical({super.key, required this.listing});

  final ListingModel listing;

  @override
  State<TPropertyCardVertical> createState() => _TPropertyCardVerticalState();
}

class _TPropertyCardVerticalState extends State<TPropertyCardVertical> {
  bool isHovering = false;
  bool isIconHovering = false; // State to track hover on the icon

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return InkWell(
      onHover: (hovering) {
        setState(() {
          isHovering = hovering;
        });
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Get.toNamed(TRoutes.listingViewing);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TRoundedContainer(
            margin: EdgeInsets.zero,
            showShadow: false,
            backgroundColor: TColors.primaryBackground,
            height: 220,
            width: 370,
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                PropertyHomeImageSlider(
                  property: widget.listing,
                  isHovering: isHovering,
                ),

                /// Favorite Icon Button with hover effect
                Positioned(
                  top: 0,
                  right: 0,
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isIconHovering = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isIconHovering = false;
                      });
                    },
                    child: IconButton(
                      icon: widget.listing.listingId == "5" ||
                              widget.listing.listingId == "3"
                          ? SvgPicture.asset(
                              "assets/icons/custom_icons/unfavorited_heart.svg",
                              height: isIconHovering
                                  ? 30
                                  : 24, // Increase height on hover
                            )
                          : SvgPicture.asset(
                              "assets/icons/custom_icons/favorited_heart.svg",
                              height: isIconHovering
                                  ? 30
                                  : 24, // Increase height on hover
                            ),
                      onPressed: () => {},
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Property Details
          const SizedBox(
            height: 16,
          ),
          PropertyDetails(property: widget.listing),
        ],
      ),
    );
  }
}
