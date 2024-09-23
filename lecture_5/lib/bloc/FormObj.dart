class FormObj {
  String name;
  String age;
  String email;

  FormObj({required this.name, required this.age, required this.email});

  @override
  operator ==(Object other) {
    return other is FormObj && other.name == name && other.age == age && other.email == email;
  }

  @override
  int get hashCode => name.hashCode;


  @override
  String toString() {
    return 'Form{name: $name, age: $age, email: $email}';
  }


  FormObj copyWith({String? name, String? age, String? email}) {
    return FormObj(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }
}
