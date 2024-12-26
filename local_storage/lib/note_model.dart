import 'package:hive/hive.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
@JsonSerializable()
class HivedNote {
  @HiveField(0)
  final String note;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2,defaultValue: '')
  final String id;

  HivedNote(this.note,this.createdAt,this.id);

  factory HivedNote.fromJson(Map<String, dynamic> json) => _$HivedNoteFromJson(json);

  Map<String, dynamic> toJson() => _$HivedNoteToJson(this);
}