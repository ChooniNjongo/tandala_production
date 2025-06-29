import 'package:flutter/material.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/property_type_bottom_navigation_bar.dart';

class PropertyTypeMobileScreen extends StatelessWidget {
  const PropertyTypeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PropertyTypeBody(),
      bottomNavigationBar: PropertyTypeBottomNavigationBar(),
    );
  }
}
