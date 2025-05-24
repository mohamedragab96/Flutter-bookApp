import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  void fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (failure) => emit(FeaturedBooksError(errorMessage: failure.message)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
