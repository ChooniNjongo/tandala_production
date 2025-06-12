import 'package:flutter/material.dart';

class QuickLinkName extends StatelessWidget {
  const QuickLinkName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        name,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'InterDisplay',
          fontWeight: FontWeight.w500,
          fontSize: 19,
          height: 1.4, // line-height of 140%
          letterSpacing: 0,
        ),
      ),
    );
  }
}
