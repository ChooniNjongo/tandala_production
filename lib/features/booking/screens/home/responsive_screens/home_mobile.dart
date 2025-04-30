import 'package:flutter/material.dart';
import '../widgets/mobile/animated_drawer.dart';
import '../widgets/mobile/home_content.dart';

class HomeMobileScreen extends StatelessWidget {
  HomeMobileScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(child: const HomeContent());
  }
}
