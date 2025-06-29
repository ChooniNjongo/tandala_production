import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Increased width to match design spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First row: Client and Date
          Row(
            children: [
              const HeaderListItem(
                title: 'Client',
                subtitle: 'John Doe',
              ),
              const SizedBox(width: 150), // Fixed spacing to align Date properly
              const HeaderListItem(
                title: 'Date',
                subtitle: 'March 2023',
              ),
            ],
          ),
          const SizedBox(height: 32), // Spacing between rows

          // Second row: Location and Price
          Row(
            children: [
              const HeaderListItem(
                title: 'Location',
                subtitle: 'Bali, Indonesia',
              ),
              const SizedBox(width: 80), // Different spacing for Location/Price alignment
              const HeaderListItem(
                title: 'Price',
                subtitle: '\$987,890',
                price: true,
              ),
            ],
          ),
        ],
      ),
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Title
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF888888),
            fontFamily: 'InterDisplay',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.4, // 140% line height
          ),
        ),
        const SizedBox(height: 8),

        /// Subtitle
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFFE5F7F9),
                fontFamily: 'InterDisplay',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 1.5, // 150% line height
              ),
            ),
            const SizedBox(width: 8),
            if (price!)
              const Text(
                "/night",
                style: TextStyle(
                  color: Color(0xFF6D6D6D),
                  fontFamily: 'InterDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.4, // 140% line height
                ),
              ),
          ],
        )
      ],
    );
  }
}