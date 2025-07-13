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
    var data = await azkarDetailsService.get(endPoint: '/APIs/azkar');
    List<AzkarDetailsEntity> azkar = getAzkarList(data, category);
    saveAzkarData(azkar, category, kAzkarBox);
    return azkar;
  }

  List<AzkarDetailsEntity> getAzkarList(
    Map<String, dynamic> data,
    String category,
  ) {
    List<AzkarDetailsEntity> azkar = [];

    if (!data.containsKey(category)) {
      print('⚠️ Category "$category" not found in response.');
      print('Available keys: ${data.keys}');
      return [];
    }

    final list = data[category];
    if (list is! List) {
      print('⚠️ The value for "$category" is not a List.');
      return [];
    }

    for (var azkarMap in list) {
      azkar.add(AzkarDetailsModel.fromJson(azkarMap));
    }

    return azkar;
  }
}
