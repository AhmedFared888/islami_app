import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/use_case.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';
import 'package:islami/features/azkar/domain/repos/azkar_details_repo.dart';

class AzkarDetailsUseCase extends UseCase<List<AzkarDetailsEntity>, String> {
  final AzkarDetailsRepo azkarDetailsRepo;

  AzkarDetailsUseCase(this.azkarDetailsRepo);

  @override
  Future<Either<Failure, List<AzkarDetailsEntity>>> execute(String category) {
    return azkarDetailsRepo.fetchAzkar(category: category);
  }
}
