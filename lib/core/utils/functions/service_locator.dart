import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islami/core/utils/api_service.dart';
import 'package:islami/features/azkar/data/data_sources/azkar_details_local_data_source.dart';
import 'package:islami/features/azkar/data/data_sources/azkar_details_remote_data_source.dart';
import 'package:islami/features/azkar/data/repos/azkar_details_repo.dart';
import 'package:islami/features/home/data/data_sources/home_local_data_source.dart';
import 'package:islami/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:islami/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // home

  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );

  // azkar details

  getIt.registerLazySingleton<AzkarDetailsService>(
    () => AzkarDetailsService(Dio()),
  );
  getIt.registerLazySingleton<AzkarDetailsRepoImpl>(
    () => AzkarDetailsRepoImpl(
      azkarDetailsLocalDataSource: AzkarDetailsLocalDataSourceImpl(),
      azkarDetailsRemoteDataSource: AzkarDetailsRemoteDataSourceImpl(
        getIt.get<AzkarDetailsService>(),
      ),
    ),
  );
}
