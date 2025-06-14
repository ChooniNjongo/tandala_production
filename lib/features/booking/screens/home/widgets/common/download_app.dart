import 'package:cwt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_link_item.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_link_name.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DownloadApp extends StatelessWidget {
  const DownloadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const QuickLinkName(name: "Get Our App"),
        SvgPicture.asset(TImages.appStore),
        const SizedBox(
          height: 16,
        ),
        SvgPicture.asset(TImages.googlePlay),
        const SizedBox(
          height: 24,
        ),


      ],
    );
  }
}
