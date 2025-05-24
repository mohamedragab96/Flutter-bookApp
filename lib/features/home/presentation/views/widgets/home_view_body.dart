import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book_app/features/home/presentation/views/widgets/featured_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        SizedBox(height: 20),
        Expanded(
          /////// CustomScrollView
          ///
          child: CustomScrollView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: FeaturedBooksListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: BestSellerTitle(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
              SliverToBoxAdapter(
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
          style: Styles.subtitle20.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
