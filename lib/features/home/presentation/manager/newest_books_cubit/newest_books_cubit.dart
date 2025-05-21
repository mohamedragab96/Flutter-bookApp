import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewestBooksError(errorMessage: failure.message)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }
}
