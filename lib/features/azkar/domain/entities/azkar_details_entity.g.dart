// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AzkarDetailsEntityAdapter extends TypeAdapter<AzkarDetailsEntity> {
  @override
  final int typeId = 3;

  @override
  AzkarDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AzkarDetailsEntity(
      zekrId: fields[0] as int,
      body: fields[1] as String,
      countOfZekr: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AzkarDetailsEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.zekrId)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.countOfZekr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AzkarDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
