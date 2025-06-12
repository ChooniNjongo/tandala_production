import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_link_item.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_link_name.dart';
import 'package:flutter/material.dart';

class Legal extends StatelessWidget {
  const Legal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuickLinkName(name: "Legal"),
        QuickLinkItem(item: "Terms & Conditions"),
        QuickLinkItem(item: "Privacy Policy"),
        QuickLinkItem(item: "Contact"),

      ],
    );
  }
}
