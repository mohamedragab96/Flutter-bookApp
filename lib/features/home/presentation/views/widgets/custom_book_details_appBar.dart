// ignore: file_names
import 'package:book_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 40, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: GestureDetector(
              child: const Icon(Icons.clear, size: 30),
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: GestureDetector(
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
