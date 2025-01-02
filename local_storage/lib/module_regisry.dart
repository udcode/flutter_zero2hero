import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

import 'note_model.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box> provideNotesBox() async {
    await Hive.initFlutter();
    if(!Hive.isAdapterRegistered(HivedNoteAdapter().typeId)){
      Hive.registerAdapter(HivedNoteAdapter());
    }
    if(!Hive.isBoxOpen('notes')){
      return Hive.openBox<HivedNote>('notes');
    }
    return Hive.box('notes');
  }
}