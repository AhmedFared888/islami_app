import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/azkar/data/data_sources/azkar_details_local_data_source.dart';
import 'package:islami/features/azkar/data/data_sources/azkar_details_remote_data_source.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';
import 'package:islami/features/azkar/domain/repos/azkar_details_repo.dart';

class AzkarDetailsRepoImpl extends AzkarDetailsRepo {
  final AzkarDetailsLocalDataSource azkarDetailsLocalDataSource;
  final AzkarDetailsRemoteDataSource azkarDetailsRemoteDataSource;

  AzkarDetailsRepoImpl({
    required this.azkarDetailsLocalDataSource,
    required this.azkarDetailsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<AzkarDetailsEntity>>> fetchAzkar({
    required String category,
  }) async {
    try {
      var azkarLocal = azkarDetailsLocalDataSource.fetchAzkarDetails(
        category: category,
      );
      if (azkarLocal != null) {
        return right(azkarLocal);
      }
      var azkarDetails = await azkarDetailsRemoteDataSource.fetchAzkarDetails(
        category: category,
      );
      return right(azkarDetails);
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
