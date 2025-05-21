import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:book_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_app/features/home/domain/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  ));
}
