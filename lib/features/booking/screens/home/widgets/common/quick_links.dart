import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_link_item.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_link_name.dart';
import 'package:flutter/material.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuickLinkName(name: "Quick Links"),
        QuickLinkItem(item: "List your properties"),
        QuickLinkItem(item: "How Tandala works"),
        QuickLinkItem(item: "How to report a listing"),

      ],
    );
  }
}
