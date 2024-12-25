// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivedNoteAdapter extends TypeAdapter<HivedNote> {
  @override
  final int typeId = 0;

  @override
  HivedNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivedNote(
      fields[0] as String,
      fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HivedNote obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.note)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivedNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HivedNote _$HivedNoteFromJson(Map<String, dynamic> json) => HivedNote(
      json['note'] as String,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$HivedNoteToJson(HivedNote instance) => <String, dynamic>{
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
    };