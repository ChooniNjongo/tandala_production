import 'package:flutter/material.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/name_city_bottom_navigation_bar.dart';

class NameAndCityMobileScreen extends StatelessWidget {
  const NameAndCityMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NameAndCityBody(),
      bottomNavigationBar: NameCityBottomNavigationBar(),
    );
  }
}