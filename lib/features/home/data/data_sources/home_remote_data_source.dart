import 'package:islami/features/home/domain/entities/surah_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<SurahEntity>> fetchSurahs();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<SurahEntity>> fetchSurahs() {
    // TODO: implement fetchSurahs
    throw UnimplementedError();
  }
}
