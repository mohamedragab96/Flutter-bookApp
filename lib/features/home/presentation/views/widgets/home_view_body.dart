import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_app_bar.dart';

import 'package:book_app/features/home/presentation/views/widgets/featured_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        const SizedBox(height: 20),
        Expanded(
          /////// CustomScrollView
          ///
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: FeaturedBooksListView(
                  books:
                      books, /////////////////////////////////////////////////////////////////////
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: BestSellerTitle(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
              const SliverToBoxAdapter(
                child: BestSellerListView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BestSellerTitle extends StatelessWidget {
  const BestSellerTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Best Seller',
          style: Styles.subtitle20
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
