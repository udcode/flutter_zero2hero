// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_service.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: (json['age'] as num?)?.toInt(),
      gender: userGenderNullableFromJson(json['gender']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'gender': userGenderNullableToJson(instance.gender),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
