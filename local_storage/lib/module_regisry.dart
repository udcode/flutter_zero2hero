import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

import 'note_model.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box> provideBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HivedNoteAdapter());

    return Hive.openBox<HivedNote>('notes');
  }
}