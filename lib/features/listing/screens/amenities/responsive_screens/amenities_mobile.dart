import 'package:flutter/material.dart';
import '../widgets/mobile/add_amenities_bottom_navigation_bar.dart';
import '../widgets/mobile/body.dart';

class AmenitiesMobileScreen extends StatelessWidget {
  const AmenitiesMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AmenitiesBody(),
      bottomNavigationBar : AddAmenitiesBottomNavigationBar()
    );
  }
}
