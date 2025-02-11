// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/adapters.dart' as _i744;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_storage/module_regisry.dart' as _i678;
import 'package:local_storage/note_model.dart' as _i943;
import 'package:local_storage/task_repo.dart' as _i502;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hiveModule = _$HiveModule();
    await gh.factoryAsync<_i744.Box<_i943.HivedNote>>(
      () => hiveModule.provideNotesBox(),
      preResolve: true,
    );
    await gh.factoryAsync<_i744.Box<_i943.HivedNote2>>(
      () => hiveModule.provideNotes2Box(),
      preResolve: true,
    );
    gh.singleton<_i502.TaskRepository2>(
        () => _i502.TaskRepository2(gh<_i979.Box<_i943.HivedNote2>>()));
    gh.singleton<_i502.TaskRepository>(
        () => _i502.TaskRepository(gh<_i979.Box<_i943.HivedNote>>()));
    return this;
  }
}

class _$HiveModule extends _i678.HiveModule {}
