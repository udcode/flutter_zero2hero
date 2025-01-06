import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum UserGender {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('male')
  male('male'),
  @JsonValue('female')
  female('female'),
  @JsonValue('other')
  other('other');

  final String? value;

  const UserGender(this.value);
}
