import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.mainAxisAlignment,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
        ),

        // rating
        Text(
          '4.8',
          style: Styles.body16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),

        // number of ratings
        Text(
          '(2578)',
          style: Styles.body16.copyWith(
            fontSize: 13,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
