import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 15,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            child: const BookListViewItem(),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kBookDetailsView);
            },
          ),
        );
      },
    );
  }
}
