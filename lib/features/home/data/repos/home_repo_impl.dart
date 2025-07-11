import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/home/data/data_sources/home_local_data_source.dart';
import 'package:islami/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<SurahEntity>>> fetchSurahs() async {
    try {
      var surahsLocal = await homeLocalDataSource.fetchSurahs();
      if (surahsLocal.isNotEmpty) {
        return right(surahsLocal);
      }
      var surahs = await homeRemoteDataSource.fetchSurahs();

      return right(surahs);
    } catch (e, s) {
      print(s);
      print(e);
      if (e is DioException) {
        return left(ServerFailre.fromDioException(e));
      } else {
        return left(ServerFailre(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SurahDetailsEntity>> fetchSurahDetails(
    int surahId,
  ) async {
    try {
      final surahDetailsLocal = homeLocalDataSource.fetchSurahDetails(surahId);

      if (surahDetailsLocal != null) {
        return right(surahDetailsLocal);
      }

      final surahDetails = await homeRemoteDataSource.fetchSurahDetails(
        surahId,
      );
      return right(surahDetails);
    } catch (e, s) {
      print(s);
      print(e);
      if (e is DioException) {
        return left(ServerFailre.fromDioException(e));
      } else {
        return left(ServerFailre(e.toString()));
      }
    }
  }
}
