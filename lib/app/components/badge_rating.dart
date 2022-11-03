import 'package:flutter/material.dart';

class BadgeRating extends StatelessWidget {
  final int rating;
  const BadgeRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.star_rate_rounded,
            color: Colors.orange,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            rating.toString(),
          ),
        ],
      ),
    );
  }
}
