import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/use_case.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';
import 'package:islami/features/home/domain/repos/home_repo.dart';

class SurahDetailsUseCase extends UseCase<List<SurahDetailsEntity>, int> {
  final HomeRepo homeRepo;

  SurahDetailsUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<SurahDetailsEntity>>> execute(int surahId) {
    return homeRepo.fetchSurahDetails(surahId);
  }
}
