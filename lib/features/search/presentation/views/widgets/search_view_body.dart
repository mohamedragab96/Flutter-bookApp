import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:book_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomSearchTextField(),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Results',
              style: Styles.subtitle20,
            ),
          ),
          SizedBox(height: 7),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 15,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              child: const BookListViewItem(
                image: '',
                title: '',
                author: '',
                price: 0,
                rating: 0,
              ),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView);
              },
            ),
          );
        },
      ),
    );
  }
}
