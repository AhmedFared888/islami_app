import 'package:islami/features/home/domain/entities/ayah_entity.dart';

class AyahModel extends AyahEntity {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  AyahModel({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  }) : super(ayahNumberInSurah: numberInSurah!, ayahBody: text!);

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
    number: json['number'] as int?,
    text: json['text'] as String?,
    numberInSurah: json['numberInSurah'] as int?,
    juz: json['juz'] as int?,
    manzil: json['manzil'] as int?,
    page: json['page'] as int?,
    ruku: json['ruku'] as int?,
    hizbQuarter: json['hizbQuarter'] as int?,
    sajda: json['sajda'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'text': text,
    'numberInSurah': numberInSurah,
    'juz': juz,
    'manzil': manzil,
    'page': page,
    'ruku': ruku,
    'hizbQuarter': hizbQuarter,
    'sajda': sajda,
  };
}
