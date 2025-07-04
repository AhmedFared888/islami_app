// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AyahEntityAdapter extends TypeAdapter<AyahEntity> {
  @override
  final int typeId = 2;

  @override
  AyahEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AyahEntity(
      ayahNumberInSurah: fields[0] as int,
      ayahBody: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AyahEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ayahNumberInSurah)
      ..writeByte(1)
      ..write(obj.ayahBody);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyahEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
