import 'package:flutter/material.dart';

class QuickLinkItem extends StatelessWidget {
  const QuickLinkItem({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        item,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Color(0xFF6D6D6D),
          fontFamily: 'InterDisplay',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          height: 1.4, // line-height of 140%
          letterSpacing: 0,
        ),
      ),
    );
  }
}
