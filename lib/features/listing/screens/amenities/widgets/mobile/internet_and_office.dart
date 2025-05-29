import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';

class InternetAndOfficeSection extends StatelessWidget {
  const InternetAndOfficeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionInputList(
          title: 'Heating And Cooling',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Wifi',
              isSelected: false.obs,
            ),
            TInputListItem(inputListName: 'Workspace', isSelected: false.obs),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
