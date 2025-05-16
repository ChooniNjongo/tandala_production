import 'package:flutter/material.dart';

class SquareImageCard extends StatelessWidget {
  final String imageUrl;

  const SquareImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: screenWidth,       // dynamic width
        height: screenWidth,      // same as width to make it square
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
