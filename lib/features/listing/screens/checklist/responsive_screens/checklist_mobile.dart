import 'package:cwt_ecommerce_admin_panel/features/listing/screens/checklist/widgets/mobile/add_checklist_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/mobile/body.dart';

class ChecklistMobileScreen extends StatelessWidget {
  const ChecklistMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChecklistBody(),
      bottomNavigationBar: AddChecklistBottomNavigationBar(),
    );
  }
}
