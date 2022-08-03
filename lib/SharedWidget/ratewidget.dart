import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final double rating;
  RateWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        const Icon(
          Icons.star_rounded,
          size: 15,
          color: Color(0xFFFDA537),
        ),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
