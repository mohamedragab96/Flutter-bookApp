import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  child: BookListViewItem(
                    image: state.books[index].image.toString(),
                    title: state.books[index].title.toString(),
                    author: state.books[index].author.toString(),
                    price: state.books[index].price?.toDouble() ?? 1.5555,
                    rating: state.books[index].rating != null
                        ? double.tryParse(
                                state.books[index].rating.toString()) ??
                            0.1
                        : 0.2,
                  ),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView);
                  },
                ),
              );
            },
          );
        } else if (state is NewestBooksError) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
