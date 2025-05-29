import 'package:flutter/material.dart';

import '../../../../../common/pages/success.dart';

class DoneMobileScreen extends StatelessWidget {
  const DoneMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessPage(
      image: 'assets/images/animations/congratulation.json',
      title: 'Woohoo!',
      subTitle:
          'Listing  complete! Approval is done in 24 hours, we will send you message when approved.',
    );
  }
}
