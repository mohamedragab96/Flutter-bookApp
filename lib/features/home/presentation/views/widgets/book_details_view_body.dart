import 'package:book_app/constants.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_details_appBar.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_app/features/home/presentation/views/widgets/similar_book_listview.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const CustomBookDetailsAppBar(),
          const SizedBox(height: 40),
          const CustomBookImage(
            image: '',
          ),
          const SizedBox(height: 10),
          const Text(
            'Fatih Sultan Mehmet',
            style: Styles.subtitle20,
          ),
          const SizedBox(height: 3),
          Text(
            'AD Stories',
            style: Styles.body16.copyWith(
              fontSize: 14,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 10),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            rating: 0.0,
          ),
          const SizedBox(height: 10),
          const BooksAction(),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('you can also like'),
            ),
          ),
          const SizedBox(height: 20),
          const SimilarBookListView(),
        ],
      ),
    );
  }
}
