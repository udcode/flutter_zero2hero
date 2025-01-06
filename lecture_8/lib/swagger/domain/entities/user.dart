class UserEntity {
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.age,
    this.gender,
    this.createdAt,
  });


  final String id;

  final String name;

  final String email;

  final int? age;

  final UserGender? gender;

  final DateTime? createdAt;
}

enum UserGender {

swaggerGeneratedUnknown(null),


male('male'),

female('female'),

other('other');

final String? value;

const UserGender(this.value);
}