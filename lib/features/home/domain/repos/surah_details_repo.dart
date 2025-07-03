import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';

abstract class SurahDetailsRepo {
  Future<Either<Failure, List<SurahDetailsEntity>>> fetchSurahDetails();
}
