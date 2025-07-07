import 'package:islami/constants.dart';
import 'package:islami/core/utils/api_service.dart';
import 'package:islami/core/utils/functions/save_azkar_details.dart';
import 'package:islami/features/azkar/data/models/azkar_details_model.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';

abstract class AzkarDetailsRemoteDataSource {
  Future<List<AzkarDetailsEntity>> fetchAzkarDetails({
    required String category,
  });
}

class AzkarDetailsRemoteDataSourceImpl extends AzkarDetailsRemoteDataSource {
  final AzkarDetailsService azkarDetailsService;

  AzkarDetailsRemoteDataSourceImpl(this.azkarDetailsService);

  @override
  Future<List<AzkarDetailsEntity>> fetchAzkarDetails({
    required String category,
  }) async {
    var data = await azkarDetailsService.get(endPoint: 'azkar.json');
    List<AzkarDetailsEntity> azkar = [];
    for (var azkarMap in data[category]) {
      azkar.add(AzkarDetailsModel.fromJson(azkarMap));
    }

    saveAzkarData(azkar, kAzkarBox);

    print(data);
    return azkar;
  }
}
