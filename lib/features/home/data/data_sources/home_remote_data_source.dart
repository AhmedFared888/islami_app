import 'package:islami/constants.dart';
import 'package:islami/core/utils/api_service.dart';
import 'package:islami/core/utils/functions/save_surah_details.dart';
import 'package:islami/core/utils/functions/save_surahs.dart';
import 'package:islami/features/home/data/models/surah_details_model/surah_details_model.dart';
import 'package:islami/features/home/data/models/surah_model.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<SurahEntity>> fetchSurahs();
  Future<SurahDetailsEntity> fetchSurahDetails(int surahNumber);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<SurahEntity>> fetchSurahs() async {
    var data = await apiService.get(endPoint: 'surah');
    List<SurahEntity> surahs = [];
    for (var surahMap in data['data']) {
      surahs.add(SurahModel.fromJson(surahMap));
    }
    saveSurahsData(surahs, kSurahsBox);

    print(data);
    return surahs;
  }

  @override
  Future<SurahDetailsEntity> fetchSurahDetails(int surahNumber) async {
    var data = await apiService.get(endPoint: 'surah/$surahNumber');
    final surahDetails = SurahDetailsModel.fromJson(data['data']);

    saveSurahDetails(surahDetails, kSurahDetailsBox);

    print(data);
    return surahDetails;
  }
}
