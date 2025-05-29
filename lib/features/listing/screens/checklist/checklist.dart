import 'package:cwt_ecommerce_admin_panel/features/listing/screens/checklist/responsive_screens/checklist_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class ChecklistScreen extends StatelessWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: ChecklistMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  ChecklistMobileScreen(),
    );
  }
}
