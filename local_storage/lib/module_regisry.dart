import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

import 'note_model.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box<HivedNote>> provideNotesBox() async {

    if(!Hive.isAdapterRegistered(HivedNoteAdapter().typeId)){
      await Hive.initFlutter();
      Hive.registerAdapter(HivedNoteAdapter());
    }
    if(!Hive.isBoxOpen('notes')){
      return Hive.openBox<HivedNote>('notes');
    }
    return Hive.box('notes');
  }


  @preResolve
  Future<Box<HivedNote2>> provideNotes2Box() async {
    await Hive.initFlutter();
    if(!Hive.isAdapterRegistered(HivedNote2Adapter().typeId)){
      Hive.registerAdapter(HivedNote2Adapter());
    }
    if(!Hive.isBoxOpen('notes2')){
      return Hive.openBox<HivedNote2>('notes2');
    }
    return Hive.box('notes2');
  }
}