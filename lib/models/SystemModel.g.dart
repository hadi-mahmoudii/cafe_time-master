// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SystemModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SystemModelAdapter extends TypeAdapter<SystemModel> {
  @override
  final int typeId = 0;

  @override
  SystemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SystemModel(
      name: fields[0] as String,
      price: fields[1] as double,
      controller: fields[2] as int,
      time: fields[3] as DateTime,
      isPlaying: fields[4] as bool,
    )
      ..seconds = fields[5] as int
      ..minutes = fields[6] as int
      ..hours = fields[7] as int;
  }

  @override
  void write(BinaryWriter writer, SystemModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.controller)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.isPlaying)
      ..writeByte(5)
      ..write(obj.seconds)
      ..writeByte(6)
      ..write(obj.minutes)
      ..writeByte(7)
      ..write(obj.hours);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
