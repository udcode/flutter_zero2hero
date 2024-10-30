class UserModel{
  String? name;
  String? email;
  String? phone;

  UserModel({this.name, this.email, this.phone});


  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      name: json['userName'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}