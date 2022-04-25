import 'package:Change/App/models/user_model.dart';

abstract class AuthRepositoryClinica{
    Future<UserModelClinica> loginclinica(String cnpj, String password);
    Future<UserModelClinica> registerclinica(String name, String cnpj,String email, String rua, String cep, String bairro, String password);
}
abstract class AuthRepositoryPaciente{
    Future<UserModelPaciente> loginpaciente(String cpf, String password);
    Future<UserModelPaciente> registerpaciente(String name, String rg, String cpf, String telefone, String date, String email, String password);
}
abstract class AuthRepositoryMedico {
  Future<UserModelMedico> registermedico(String name, String especialidade, String horario);
}