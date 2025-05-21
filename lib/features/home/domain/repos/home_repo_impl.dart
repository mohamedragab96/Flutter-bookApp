import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:book_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books = homeLocalDataSource.getFeaturedBooks();

      if (books.isNotEmpty) {
        return right(books);
      } else {
        books = await homeRemoteDataSource.fetchFeaturedBooks();
        return right(books);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books = homeLocalDataSource.getNewestBooks();

      if (books.isNotEmpty) {
        return right(books);
      } else {
        books = await homeRemoteDataSource.fetchNewestBooks();
        return right(books);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
