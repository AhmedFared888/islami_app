import 'package:islami/core/utils/api_service.dart';
import 'package:islami/features/home/data/models/surah_model.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<SurahEntity>> fetchSurahs();
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
    return surahs;
  }
}
