import 'dart:convert';
import 'package:flutter/material.dart';

class UserModelClinica {

  final int id;
  final String name;
  final String cnpj;
  final String bairro;
  final String rua;
  final String cep;
  final String telefone;
  final String email;
  final String password;

  UserModelClinica({
    required this.id,
    required this.name,
    required this.bairro,
    required this.rua,
    required this.cep,
    required this.telefone,
    required this.cnpj,
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
      'telefone': telefone,
      'bairro': bairro,
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
      bairro: map['bairro'] ?? '',
      rua: map['rua'] ?? '',
      cep: map['cep'] ?? '',
      telefone: map['telefone'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelClinica.fromJson(String source) => UserModelClinica.fromMap(json.decode(source));
}
class UserModelPaciente {

  final int id;
  final String name;
  final String rg;
  final String cpf;
  final String date;
  final String telefone;
  final String email;
  final String password;

  UserModelPaciente({
    required this.id,
    required this.name,
    required this.cpf,
    required this.date,
    required this.rg,
    required this.telefone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'cpf': cpf,
      'date': date,
      'rg': rg,
      'telefone': telefone,
      'password': password,
    };
  }

  factory UserModelPaciente.fromMap(Map<String, dynamic> map) {
    return UserModelPaciente(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      cpf: map['cpf'] ?? '',
      rg: map['rg'] ?? '',
      telefone: map['telefone'] ?? '',
      date: map['date'] ?? '',
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