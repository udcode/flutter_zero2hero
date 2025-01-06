import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'domain/entities/user.dart';
import 'generated_api/users_service.swagger.dart' as  api;

import 'api_models_mapper.auto_mappr.dart';
@AutoMappr([
  MapType<UserGender, api.UserGender>(reverse: true),
  MapType<UserEntity, api.User>(reverse: true,fields: [
    Field('id', from:'userId'),
    Field('name', from:'name'),
    Field('email', from:'email'),
])])
class ApiModelsMapper extends $ApiModelsMapper {
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return true;
  }
}
