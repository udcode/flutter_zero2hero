// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'users_service.enums.swagger.dart' as enums;
export 'users_service.enums.swagger.dart';

part 'users_service.swagger.chopper.dart';
part 'users_service.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class UsersService extends ChopperService {
  static UsersService create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$UsersService(client);
    }

    final newClient = ChopperClient(
        services: [_$UsersService()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://api.example.com/v1'));
    return _$UsersService(newClient);
  }

  ///Get list of users
  Future<chopper.Response<List<User>>> usersGet() {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _usersGet();
  }

  ///Get list of users
  @Get(path: '/users')
  Future<chopper.Response<List<User>>> _usersGet();

  ///Create a new user
  ///@param user User object to be created
  Future<chopper.Response<User>> usersPost({required User? user}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _usersPost(user: user);
  }

  ///Create a new user
  ///@param user User object to be created
  @Post(path: '/users')
  Future<chopper.Response<User>> _usersPost({@Body() required User? user});

  ///Get user by ID
  ///@param userId
  Future<chopper.Response<User>> usersUserIdGet({required String? userId}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _usersUserIdGet(userId: userId);
  }

  ///Get user by ID
  ///@param userId
  @Get(path: '/users/{userId}')
  Future<chopper.Response<User>> _usersUserIdGet(
      {@Path('userId') required String? userId});
}

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    this.age,
    this.gender,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'age')
  final int? age;
  @JsonKey(
    name: 'gender',
    toJson: userGenderNullableToJson,
    fromJson: userGenderNullableFromJson,
  )
  final enums.UserGender? gender;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  static const fromJsonFactory = _$UserFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(createdAt) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith(
      {String? id,
      String? name,
      String? email,
      int? age,
      enums.UserGender? gender,
      DateTime? createdAt}) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        createdAt: createdAt ?? this.createdAt);
  }

  User copyWithWrapped(
      {Wrapped<String>? id,
      Wrapped<String>? name,
      Wrapped<String>? email,
      Wrapped<int?>? age,
      Wrapped<enums.UserGender?>? gender,
      Wrapped<DateTime?>? createdAt}) {
    return User(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        email: (email != null ? email.value : this.email),
        age: (age != null ? age.value : this.age),
        gender: (gender != null ? gender.value : this.gender),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt));
  }
}

String? userGenderNullableToJson(enums.UserGender? userGender) {
  return userGender?.value;
}

String? userGenderToJson(enums.UserGender userGender) {
  return userGender.value;
}

enums.UserGender userGenderFromJson(
  Object? userGender, [
  enums.UserGender? defaultValue,
]) {
  return enums.UserGender.values
          .firstWhereOrNull((e) => e.value == userGender) ??
      defaultValue ??
      enums.UserGender.swaggerGeneratedUnknown;
}

enums.UserGender? userGenderNullableFromJson(
  Object? userGender, [
  enums.UserGender? defaultValue,
]) {
  if (userGender == null) {
    return null;
  }
  return enums.UserGender.values
          .firstWhereOrNull((e) => e.value == userGender) ??
      defaultValue;
}

String userGenderExplodedListToJson(List<enums.UserGender>? userGender) {
  return userGender?.map((e) => e.value!).join(',') ?? '';
}

List<String> userGenderListToJson(List<enums.UserGender>? userGender) {
  if (userGender == null) {
    return [];
  }

  return userGender.map((e) => e.value!).toList();
}

List<enums.UserGender> userGenderListFromJson(
  List? userGender, [
  List<enums.UserGender>? defaultValue,
]) {
  if (userGender == null) {
    return defaultValue ?? [];
  }

  return userGender.map((e) => userGenderFromJson(e.toString())).toList();
}

List<enums.UserGender>? userGenderNullableListFromJson(
  List? userGender, [
  List<enums.UserGender>? defaultValue,
]) {
  if (userGender == null) {
    return defaultValue;
  }

  return userGender.map((e) => userGenderFromJson(e.toString())).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
