import 'package:islami/features/home/data/models/surah_details_model/ayah_model.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';

import 'edition.dart';

class SurahDetailsModel extends SurahDetailsEntity {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<AyahModel>? ayahModel;
  Edition? edition;

  SurahDetailsModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahModel,
    this.edition,
  }) : super(
         surahTitle: name ?? '',
         ayahs: ayahModel ?? [],
         surahNumber: number!,
       );

  factory SurahDetailsModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailsModel(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
      ayahModel: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => AyahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      edition: json['edition'] == null
          ? null
          : Edition.fromJson(json['edition'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'number': number,
    'name': name,
    'englishName': englishName,
    'englishNameTranslation': englishNameTranslation,
    'revelationType': revelationType,
    'numberOfAyahs': numberOfAyahs,
    'ayahs': ayahModel?.map((e) => e.toJson()).toList(),
    'edition': edition?.toJson(),
  };
}
