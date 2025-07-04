// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahDetailsEntityAdapter extends TypeAdapter<SurahDetailsEntity> {
  @override
  final int typeId = 1;

  @override
  SurahDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahDetailsEntity(
      surahTitle: fields[0] as String,
      ayahs: (fields[1] as List).cast<AyahEntity>(),
      surahNumber: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SurahDetailsEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.surahTitle)
      ..writeByte(1)
      ..write(obj.ayahs)
      ..writeByte(2)
      ..write(obj.surahNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
