import 'dart:convert';
class UserModelClinica {

  final int id;
  final String name;
  final String cnpj;
  final String email;
  final String password;

  UserModelClinica({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'CNPJ': cnpj,
      'email': email,
      'password': password,
    };
  }

  factory UserModelClinica.fromMap(Map<String, dynamic> map) {
    return UserModelClinica(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      cnpj: map['cnpj'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelClinica.fromJson(String source) => UserModelClinica.fromMap(json.decode(source));
}
class UserModelPaciente {

  final int id;
  final String name;
  final String email;
  final String password;

  UserModelPaciente({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserModelPaciente.fromMap(Map<String, dynamic> map) {
    return UserModelPaciente(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelPaciente.fromJson(String source) => UserModelPaciente.fromMap(json.decode(source));
}