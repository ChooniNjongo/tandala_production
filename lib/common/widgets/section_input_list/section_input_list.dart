import 'package:cwt_ecommerce_admin_panel/common/widgets/section_input_list/widgets/input_list_item.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/section_input_list/widgets/list_item_list.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/section_input_list/widgets/section_header.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/typography.dart';
import '../dividers/extensible_full_width_divider.dart';

/// Widget representing a section input list, referred to as "SECTION" in the Figma file.
class TSectionInputList extends StatelessWidget {
  /// Title of the section.
  final String title;

  final String seeAllLabel;

  /// List of input list items.
  final List<TInputListItem> listOfListInputItems;

  /// Constructor with required parameters.
  const TSectionInputList({
    super.key,
    required this.title,
    required this.listOfListInputItems,
    required this.seeAllLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // Aligns children to the start.
      children: [
        const SizedBox(height: TSizes.spaceBtwSections),
        /// Section header displaying the title.
        SectionHeader(title: title),

        /// Spacer for visual separation between title and list items (if needed).
        const SizedBox(height: 8),

        /// List of input list items.
        InputList(listOfListInputItems: listOfListInputItems),

        /// See All
        InkWell(
          child: Text(
            seeAllLabel,
            style: TTypography.label12Bold.copyWith(color: TColorSystem.n200),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        const ExtensibleFullWidthDivider(),
      ],
    );
  }
}
