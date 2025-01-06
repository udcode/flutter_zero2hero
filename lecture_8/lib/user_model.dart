import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel{
  @JsonKey(fromJson: _nameFromJson, toJson: _nameToJson,readValue: _readValue)
  int? type;
  String? email;
  @JsonKey(name: 'phone_number')
  String phone;
  UserModel({this.type, this.email, required this.phone});
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}


int? _nameFromJson(dynamic value) {
  if(value==null){
    return null;
  }
  var email=value['email'];
  if(email!=null){
    return 1;
  }
  return int.tryParse(value['type']??'0');
}

String _nameToJson(int? value) {
  return value?.toString()??'';
}

Map<String,dynamic> _readValue(val,_)=>val;