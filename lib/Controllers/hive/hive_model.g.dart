// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayingAdapter extends TypeAdapter<Playing> {
  @override
  final int typeId = 0;

  @override
  Playing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Playing()
      ..isPlaying = fields[0] as bool
      ..controller = fields[1] as int
      ..name = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, Playing obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isPlaying)
      ..writeByte(1)
      ..write(obj.controller)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
