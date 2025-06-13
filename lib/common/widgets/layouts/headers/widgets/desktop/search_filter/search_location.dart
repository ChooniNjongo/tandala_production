import 'package:flutter/material.dart';

class SearchLocation extends StatelessWidget {
  const SearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: double.infinity,
      child: TextFormField(
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          hintText: 'Search for a city,town or area..',
          hintStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
