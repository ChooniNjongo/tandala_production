import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/search_filter_header.dart';
import 'package:flutter/material.dart';
import '../../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../../utils/constants/colors.dart';
import 'filter_action_button.dart';
import 'filters.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TRoundedContainer(
      backgroundColor: TColors.primaryBackground,
      padding: EdgeInsets.zero,
      radius: 8,
      width: 560,
      height: 600,
      child: Column(children: [
        Expanded(child: Filters()),
        FilterActionButtons()
      ]),
    );
  }
}
