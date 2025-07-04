import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

import '../entities/surah_details_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SurahEntity>>> fetchSurahs();
  Future<Either<Failure, SurahDetailsEntity>> fetchSurahDetails(int surahId);
}
