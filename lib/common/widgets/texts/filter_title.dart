import 'package:flutter/material.dart';

class FilterTitle extends StatelessWidget {
  const FilterTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge!.apply(
            fontSizeFactor: 0.9,
            color: Colors.white.withOpacity(0.6),
          ),
    );
  }
}
