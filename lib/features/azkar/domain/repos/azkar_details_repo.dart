import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

abstract class AzkarDetailsRepo {
  Future<Either<Failure, AzkarDetailsEntity>> fetchAzkar({
    required String category,
  });
}
