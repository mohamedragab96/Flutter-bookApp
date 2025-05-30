import 'package:book_app/constants.dart';
import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/functions/setup_service_locator.dart';
import 'package:book_app/core/utils/functions/simple_bloc_observer.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/domain/repos/home_repo_impl.dart';
import 'package:book_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:book_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:book_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.deliusUnicaseTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
