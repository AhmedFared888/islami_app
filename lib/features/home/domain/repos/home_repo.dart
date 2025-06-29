import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SurahEntity>>> fetchSurahs();
}
