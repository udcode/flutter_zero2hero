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
      note: fields[0] as String? ?? '',
      createdAt: fields[1] as DateTime,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HivedNote obj) {
    writer.writeByte(0);
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
      note: json['note'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$HivedNoteToJson(HivedNote instance) => <String, dynamic>{
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
