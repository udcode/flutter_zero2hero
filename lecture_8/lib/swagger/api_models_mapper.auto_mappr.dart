// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import 'domain/entities/user.dart' as _i2;
import 'generated_api/users_service.enums.swagger.dart' as _i3;
import 'generated_api/users_service.swagger.dart' as _i4;

/// {@template package:lecture_8/swagger/api_models_mapper.dart}
/// Available mappings:
/// - `UserGender` → `UserGender`.
/// - `UserGender` → `UserGender`.
/// - `UserEntity` → `User`.
/// - `User` → `UserEntity`.
/// {@endtemplate}
class $ApiModelsMapper implements _i1.AutoMapprInterface {
  const $ApiModelsMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.UserGender>() ||
            sourceTypeOf == _typeOf<_i2.UserGender?>()) &&
        (targetTypeOf == _typeOf<_i3.UserGender>() ||
            targetTypeOf == _typeOf<_i3.UserGender?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.UserGender>() ||
            sourceTypeOf == _typeOf<_i3.UserGender?>()) &&
        (targetTypeOf == _typeOf<_i2.UserGender>() ||
            targetTypeOf == _typeOf<_i2.UserGender?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.UserEntity>() ||
            sourceTypeOf == _typeOf<_i2.UserEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.User>() ||
            targetTypeOf == _typeOf<_i4.User?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.User>() ||
            sourceTypeOf == _typeOf<_i4.User?>()) &&
        (targetTypeOf == _typeOf<_i2.UserEntity>() ||
            targetTypeOf == _typeOf<_i2.UserEntity?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(
        model,
        onMappingError: onMappingError,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
          (item) => _safeConvert(item, onMappingError: onMappingError));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.UserGender>() ||
            sourceTypeOf == _typeOf<_i2.UserGender?>()) &&
        (targetTypeOf == _typeOf<_i3.UserGender>() ||
            targetTypeOf == _typeOf<_i3.UserGender?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$UserGender_To__i3$UserGender((model as _i2.UserGender?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.UserGender>() ||
            sourceTypeOf == _typeOf<_i3.UserGender?>()) &&
        (targetTypeOf == _typeOf<_i2.UserGender>() ||
            targetTypeOf == _typeOf<_i2.UserGender?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$UserGender_To__i2$UserGender((model as _i3.UserGender?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.UserEntity>() ||
            sourceTypeOf == _typeOf<_i2.UserEntity?>()) &&
        (targetTypeOf == _typeOf<_i4.User>() ||
            targetTypeOf == _typeOf<_i4.User?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$UserEntity_To__i4$User((model as _i2.UserEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.User>() ||
            sourceTypeOf == _typeOf<_i4.User?>()) &&
        (targetTypeOf == _typeOf<_i2.UserEntity>() ||
            targetTypeOf == _typeOf<_i2.UserEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$User_To__i2$UserEntity((model as _i4.User?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    try {
      return _convert(
        model,
        canReturnNull: true,
      );
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:lecture_8/swagger/api_models_mapper.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.UserGender _map__i2$UserGender_To__i3$UserGender(_i2.UserGender? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UserGender → UserGender failed because UserGender was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UserGender, UserGender> to handle null values during mapping.');
    }
    return _i3.UserGender.values.firstWhere((x) => x.name == model.name);
  }

  _i2.UserGender _map__i3$UserGender_To__i2$UserGender(_i3.UserGender? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UserGender → UserGender failed because UserGender was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UserGender, UserGender> to handle null values during mapping.');
    }
    return _i2.UserGender.values.firstWhere((x) => x.name == model.name);
  }

  _i4.User _map__i2$UserEntity_To__i4$User(_i2.UserEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UserEntity → User failed because UserEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UserEntity, User> to handle null values during mapping.');
    }
    return _i4.User(
      id: model.id,
      name: model.name,
      email: model.email,
      age: model.age,
      gender: _map__i2$UserGender_To__i3$UserGender_Nullable(model.gender),
      createdAt: model.createdAt,
    );
  }

  _i2.UserEntity _map__i4$User_To__i2$UserEntity(_i4.User? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping User → UserEntity failed because User was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<User, UserEntity> to handle null values during mapping.');
    }
    return _i2.UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      age: model.age,
      gender: _map__i3$UserGender_To__i2$UserGender_Nullable(model.gender),
      createdAt: model.createdAt,
    );
  }

  _i3.UserGender? _map__i2$UserGender_To__i3$UserGender_Nullable(
      _i2.UserGender? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i3.UserGender.values.firstWhere((x) => x.name == model.name);
  }

  _i2.UserGender? _map__i3$UserGender_To__i2$UserGender_Nullable(
      _i3.UserGender? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i2.UserGender.values.firstWhere((x) => x.name == model.name);
  }
}
