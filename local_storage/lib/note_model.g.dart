// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

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
      fields[2] == null ? '' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivedNote obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.note)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.id);
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
      json['id'] as String,
    );

Map<String, dynamic> _$HivedNoteToJson(HivedNote instance) => <String, dynamic>{
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
