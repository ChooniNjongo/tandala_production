import 'package:flutter/material.dart';

import '../../../../common/widgets/navigation/nav_bar.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavBar(),
      body: Center(child: Text("Messages")),
    );
  }
}
