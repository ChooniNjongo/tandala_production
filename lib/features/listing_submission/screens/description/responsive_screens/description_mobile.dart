import 'package:flutter/material.dart';

import '../widgets/mobile/add_description_botton_navigation_bar.dart';
import '../widgets/mobile/body.dart';

class DescriptionMobileScreen extends StatelessWidget {
  const DescriptionMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DescriptionBody(),
      bottomNavigationBar: AddDescriptionBottomNavigationBar(),
    );
  }
}
