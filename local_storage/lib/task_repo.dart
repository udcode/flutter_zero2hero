import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:local_storage/note_model.dart';

import 'note_entity.dart';

@singleton
class TaskRepository {
  final Box<HivedNote> _box;

  TaskRepository(this._box);



  void saveTask(NoteEntity task) {
    _box.put(task.id,HivedNote.fromEntity(task));
  }

  List<NoteEntity> getTasks() {
    return _box.values.toList().cast<HivedNote>();
  }

  void deleteTask(String id) {

    _box.delete(id);
  }
}

@singleton
class TaskRepository2 {
  final Box<HivedNote2> _box;

  TaskRepository2(this._box);



  void saveTask(NoteEntity task) {
    _box.put(task.id,HivedNote2.fromEntity(task));
  }

  List<NoteEntity> getTasks() {
    return _box.values.toList().cast<HivedNote>();
  }

  void deleteTask(String id) {

    _box.delete(id);
  }
}