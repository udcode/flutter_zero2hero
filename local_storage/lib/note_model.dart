import 'package:hive/hive.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:local_storage/note_entity.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
@JsonSerializable()
class HivedNote extends NoteEntity{
  @HiveField(0)
  @override
  final String note;
  @HiveField(1)
  @override
  final DateTime createdAt;
  @HiveField(2,defaultValue: '')
  @override
  final String id;

  HivedNote({ this.note = '',required this.createdAt,required this.id}) : super(note: '', createdAt: createdAt, id: '');

  factory HivedNote.fromJson(Map<String, dynamic> json) => _$HivedNoteFromJson(json);

  Map<String, dynamic> toJson() => _$HivedNoteToJson(this);


  //fromEntity
  factory HivedNote.fromEntity(NoteEntity entity) {
    return HivedNote(
      note: entity.note,
      createdAt: entity.createdAt,
      id: entity.id,
    );
  }
  }



@HiveType(typeId: 1)
@JsonSerializable()
class HivedNote2 extends NoteEntity{
  @HiveField(0)
  @override
  final String note;
  @HiveField(1)
  @override
  final DateTime createdAt;
  @HiveField(2,defaultValue: '')
  @override
  final String id;

  HivedNote2({ this.note = '',required this.createdAt,required this.id}) : super(note: '', createdAt: createdAt, id: '');

  factory HivedNote2.fromJson(Map<String, dynamic> json) => _$HivedNote2FromJson(json);

  Map<String, dynamic> toJson() => _$HivedNote2ToJson(this);


  //fromEntity
  factory HivedNote2.fromEntity(NoteEntity entity) {
    return HivedNote2(
      note: entity.note,
      createdAt: entity.createdAt,
      id: entity.id,
    );
  }
}