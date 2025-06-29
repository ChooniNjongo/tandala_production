import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/image_strings.dart';

class ListingHeader extends StatelessWidget {
  const ListingHeader({super.key, required this.listing});

  final dynamic listing; // Replace with your ListingModel type

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Title, subtitle, and details
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with verification badge
              Row(
                children: [
                  const Text(
                    "Sunset Haven Apartments",
                    style: TextStyle(
                      color: Color(0xFFE5F7F9),
                      fontFamily: 'InterDisplay',
                      fontSize: 56,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Verification badge - replace with your actual icon
                  SvgPicture.asset(TImages.verify),
                ],
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                'Lorem ipsum description for ad here',
                style: TextStyle(
                  color: Color(0xFF6D6D6D),
                  fontFamily: 'InterDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 24),

              // Property details container
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFF1A2323),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailItem(detail: "1,800 Sq Ft", icon: Icons.fullscreen),
                    SizedBox(width: 24),
                    DetailItem(detail: "2 Bedrooms", icon: Icons.bed),
                    SizedBox(width: 24),
                    DetailItem(detail: "3 Bathroom", icon: Icons.bathtub),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Right side - Client info grid   sdhssdhfhh   h
        const SizedBox(
          width: 340,
          child: Column(
            children: [
              // First row: Client and Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: HeaderListItem(
                      title: 'Client',
                      subtitle: 'John Doe',
                    ),
                  ),
                  Expanded(
                    child: HeaderListItem(
                      title: 'Date',
                      subtitle: 'March 2023',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32),

              // Second row: Location and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: HeaderListItem(
                      title: 'Location',
                      subtitle: 'Bali, Indonesia',
                    ),
                  ),
                  Expanded(
                    child: HeaderListItem(
                      title: 'Price',
                      subtitle: '\$987,890',
                      price: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class DetailItem extends StatelessWidget {
  final String detail;
  final IconData icon;

  const DetailItem({super.key, required this.detail, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: const Color(0xFFE5F7F9),
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          detail,
          style: const TextStyle(
            color: Color(0xFFE5F7F9),
            fontFamily: 'InterDisplay',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class HeaderListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? price;

  const HeaderListItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.price = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF888888),
            fontFamily: 'InterDisplay',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Flexible(
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFFE5F7F9),
                  fontFamily: 'InterDisplay',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
            if (price!) ...[
              const SizedBox(width: 8),
              const Text(
                "/night",
                style: TextStyle(
                  color: Color(0xFF6D6D6D),
                  fontFamily: 'InterDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
