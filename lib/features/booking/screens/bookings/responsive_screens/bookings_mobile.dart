import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../widgets/mobile/body.dart';

class BookingsMobileScreen extends StatelessWidget {
  const BookingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: BookingsBody(),
        ),
      ),
    );
  }
}
