import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/image_strings.dart';

class PopupMenuWidget extends StatelessWidget {
  final Function(String) onItemTap;

  const PopupMenuWidget({
    super.key,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF1A2323),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMenuItem(TImages.menuPopHome, 'Home'),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(TImages.menuPopBookings, 'Bookings'),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(TImages.menuPopAccount, 'Account'),
          const SizedBox(
            height: 24,
          ),
          Divider(
            color: const Color(0xFF888888).withOpacity(0.25),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(TImages.menuPopListings, 'Listings'),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(TImages.menuPopFavorites, 'Favourites'),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(TImages.menuPopReviews, 'Reviews'),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(TImages.menuPopListingReports, 'Listing Reports'),
          const SizedBox(
            height: 24,
          ),
          Divider(
            color: const Color(0xFF888888).withOpacity(0.25),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(null, 'Send Suggestion'),
          const SizedBox(
            height: 24,
          ),
          _buildMenuItem(null, 'Get Help'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String? icon, String title) {
    return InkWell(
      onTap: () => onItemTap(title),
      hoverColor: const Color(0xFF2A3441),
      child: Row(
        children: [
          if (icon != null) SvgPicture.asset(icon),
          if (icon != null) const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFEEF2F6),
              fontFamily: 'InterDisplay',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.4,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
