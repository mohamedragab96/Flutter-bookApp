import 'package:book_app/core/utils/assets_data.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          ItemImage(),
          SizedBox(width: 20),
          ItemDetails(),
        ],
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mohamed El Fatih',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.subtitle20),
          Text(
            'AD Stories',
            style: Styles.body16.copyWith(
              fontSize: 14,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          const Row(
            children: [
              // price
              Text('\$19.99', style: Styles.subtitle20),
              Spacer(),
              BookRating(
                mainAxisAlignment: MainAxisAlignment.start,
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
  });

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
            image: const DecorationImage(
              image: AssetImage(AssetsData.testImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
