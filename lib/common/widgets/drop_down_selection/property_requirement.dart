import 'package:flutter/material.dart';

class PropertyRequirement extends StatelessWidget {
  const PropertyRequirement({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines :5,
      title,
      style:
      Theme.of(context).textTheme.labelMedium!.apply(color: Colors.black),
    );
  }
}