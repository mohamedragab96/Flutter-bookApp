import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: Styles.body16,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        hintText: 'Search ',
        suffixIcon: Opacity(opacity: 0.5, child: Icon(Icons.search)),
      ),
    );
  }
}
