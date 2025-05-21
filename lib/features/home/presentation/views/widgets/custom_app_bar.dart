import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 50, width: 80),
          Text(
            'Book App',
            style: Styles.title32.copyWith(
              fontSize: 30,
              fontFamily: GoogleFonts.lobster().fontFamily,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: const Icon(Icons.search, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
