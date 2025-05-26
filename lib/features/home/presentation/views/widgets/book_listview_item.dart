import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_rating.dart';

import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem(
      {super.key,
      required this.image,
      required this.title,
      required this.author,
      required this.price,
      required this.rating});
  final String image;
  final String title;
  final String author;
  final num price;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          ItemImage(
            bestsellerimage: image,
          ),
          const SizedBox(width: 20),
          ItemDetails(
            title: title,
            author: author,
            price: price,
            rating: rating,
          ),
        ],
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
  });
  final String title;
  final String author;
  final num price;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.subtitle20),

          // author
          Text(
            author,
            style: Styles.body16.copyWith(
              fontSize: 14,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Row(
            children: [
              // price
              Text('\$$price', style: Styles.subtitle20),
              const Spacer(),
              BookRating(
                mainAxisAlignment: MainAxisAlignment.start,
                rating: rating,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.bestsellerimage,
  });
  final String bestsellerimage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green,
            image: DecorationImage(
                image: NetworkImage(
              bestsellerimage,
            )),
          ),
        ),
      ),
    );
  }
}
