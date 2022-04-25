import 'dart:convert';

class UserModelClinica {

  final int id;
  final String name;
  final String cnpj;
  final String rua;
  final String cep;
  final String bairro;
  final String email;
  final String password;

  UserModelClinica({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.rua,
    required this.cep,
    required this.bairro,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cnpj': cnpj,
      'rua': rua,
      'cep': cep,
      'bairro': bairro,
      'email': email,
      'password': password,
    };
  }

  factory UserModelClinica.fromMap(Map<String, dynamic> map) {
    return UserModelClinica(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      cep: map['cep'] ?? '',
      bairro: map['bairro'] ?? '',
      rua: map['rua'] ?? '',
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
  final String cpf;
  final String rg;
  final String telefone;
  final String date;
  final String password;

  UserModelPaciente({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.rg,
    required this.telefone,
    required this.date,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'rg': rg,
      'telefone': telefone,
      'date': date,
      'email': email,
      'password': password,
    };
  }

  factory UserModelPaciente.fromMap(Map<String, dynamic> map) {
    return UserModelPaciente(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      rg: map['rg'] ?? '',
      date: map['date'] ?? '',
      telefone: map['telefone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelPaciente.fromJson(String source) => UserModelPaciente.fromMap(json.decode(source));
}
class UserModelMedico {
  final int id;
  final String name;
  final String especialidade;
  final String horario;

  UserModelMedico({
    required this.id,
    required this.name,
    required this.especialidade,
    required this.horario,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'especialidade': especialidade,
      'horario': horario,
    };
  }
  factory UserModelMedico.fromMap(Map<String, dynamic> map) {
    return UserModelMedico(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      especialidade: map['especialidade'] ?? '',
      horario: map['horario'] ?? '',
      );
  }
  String toJson() => json.encode(toMap());

  factory UserModelMedico.fromJson(String source) => UserModelMedico.fromMap(json.decode(source));
}