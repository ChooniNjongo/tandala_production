import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../common/quick_link_item.dart';
import '../common/quick_link_name.dart';

class EmailSubscription extends StatelessWidget {
  const EmailSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const QuickLinkName(name: "Never miss any deals"),
        const QuickLinkItem(
            item: "Subscribe to keep up with the latest content."),
        SizedBox(
          width: 320,
          child: TextField(
            style: const TextStyle(
              fontFamily: 'InterDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.4, // 140% line-height
              letterSpacing: 0,
              color: Color(0xFF888888),
            ),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                fontFamily: 'InterDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.4, // 140% line-height
                letterSpacing: 0,
                color: Color(0xFF888888),
              ),
              hintText: "Email",
              filled: true,
              fillColor: const Color(0xFF1A2323),
              // Remove all borders completely
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    TSizes.buttonRadius), // Adjusted for smaller height
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16, // Reduced vertical padding
              ),
              // This is key for reducing height
              isDense: true,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: 320,
          child: ElevatedButton(
              onPressed: () {},
              child: const Text("Subscribe",
                  style: TextStyle(
                      fontFamily: 'InterDisplay',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.4, // 140% line-height
                      letterSpacing: 0,
                      color: Colors.white))),
        )
      ],
    );
  }
}
