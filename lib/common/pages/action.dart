import 'package:flutter/material.dart';

class ActionPage extends StatelessWidget {
  final Widget body;
  final Widget? buttonContainer;

  const ActionPage({super.key, required this.body, this.buttonContainer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            /// Main Content
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 80), // Adjust top padding
                child: body,
              ),
            ),

            /// Bottom Button Container
            if (buttonContainer != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: buttonContainer!,
              ),
          ],
        ),
      ),
    );
  }
}
