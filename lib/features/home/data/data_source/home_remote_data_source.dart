import 'dart:developer';

import 'package:book_app/constants.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/core/utils/functions/save_books.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?q=programming&Filtering=free-ebooks');
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(
        BookModel.fromJson(bookMap),
      );
      log(books.toString());
    }

    /// Save the books data to local storage
    /// using the saveBooksData function.
    saveBooksData(books, kFeaturedBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?q=sports&Filtering=free-ebooks&Sorting=newest');
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
      saveBooksData(books, kNewestBooks);
    }
    return books;
  }
}
