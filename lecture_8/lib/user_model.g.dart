// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      type: _nameFromJson(_readValue(json, 'type')),
      email: json['email'] as String?,
      phone: json['phone_number'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'type': _nameToJson(instance.type),
      'email': instance.email,
      'phone_number': instance.phone,
    };
