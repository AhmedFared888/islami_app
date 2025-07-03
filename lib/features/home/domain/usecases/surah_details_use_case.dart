import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/no_param_use_case.dart';
import 'package:islami/features/home/domain/repos/surah_details_repo.dart';

class SurahDetailsUseCase extends UseCase {
  final SurahDetailsRepo surahDetailsRepo;

  SurahDetailsUseCase(this.surahDetailsRepo);
  @override
  Future<Either<Failure, dynamic>> execute() {
    // if I want to check permssion or any code I want to do here
    return surahDetailsRepo.fetchSurahDetails();
  }
}
