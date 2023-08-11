import 'dart:convert';

class pharmacie {
  final String id;
  final String name;
    final String phone;
  final String email;
  final String password;
  final String passwordconf;
  final String profession;
  final String image;
  pharmacie({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordconf,
    required this.profession,
    required this.image
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone':phone,
      'email': email,
      'password': password,
      'passwordconf': passwordconf,
      'profession': profession,
      'image': image
    };
  }

  factory pharmacie.fromMap(Map<String, dynamic> map) {
    return pharmacie(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      passwordconf: map['passwordconf'] ?? '',
      profession: map['profession'] ?? '',
      image: map['image'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory pharmacie.fromJson(String source) => pharmacie.fromMap(json.decode(source));
}
