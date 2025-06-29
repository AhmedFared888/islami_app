import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/no_param_use_case.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/domain/repos/home_repo.dart';

class HomeUseCase extends UseCase {
  final HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<SurahEntity>>> execute() async {
    // if I want to check permssion or any code I want to do here
    return await homeRepo.fetchSurahs();
  }
}
