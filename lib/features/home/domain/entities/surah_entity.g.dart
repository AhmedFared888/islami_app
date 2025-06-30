// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahEntityAdapter extends TypeAdapter<SurahEntity> {
  @override
  final int typeId = 0;

  @override
  SurahEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahEntity(
      numberOfSurah: fields[0] as int,
      enName: fields[1] as String,
      versesNumber: fields[2] as int,
      arName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SurahEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.numberOfSurah)
      ..writeByte(1)
      ..write(obj.enName)
      ..writeByte(2)
      ..write(obj.versesNumber)
      ..writeByte(3)
      ..write(obj.arName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
