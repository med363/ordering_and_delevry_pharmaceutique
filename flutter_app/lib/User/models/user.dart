import 'dart:convert';

class User {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordconf;
  final String profession;
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordconf,
    required this.profession, 
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'passwordconf': passwordconf,
      'profession': profession
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      passwordconf: map['passwordconf'] ?? '',
      profession: map['profession'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
