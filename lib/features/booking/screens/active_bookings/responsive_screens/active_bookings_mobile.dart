import 'package:flutter/material.dart';

import '../../bookings_history/widgets/mobile/body.dart';

class ActiveBookingsMobile extends StatelessWidget {
  const ActiveBookingsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: BookingsBody()),
    );
  }
}
