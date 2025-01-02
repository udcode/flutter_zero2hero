import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:local_storage/note_model.dart';

import 'note_entity.dart';

@singleton
class TaskRepository {
  final Box _box;

  TaskRepository(this._box);



  void saveTask(NoteEntity task) {
    _box.put(task.id,task);
  }

  List<NoteEntity> getTasks() {
    return _box.values.toList().cast<HivedNote>();
  }

  void deleteTask(String id) {

    _box.delete(id);
  }
}