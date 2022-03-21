import 'package:vakinha_burger_mobile/App/models/user_model.dart';

abstract class AuthRepositoryClinica{
    Future<UserModelClinica> loginclinica(String cnpj, String password);
    Future<UserModelClinica> registerclinica(String name, String cnpj,String email, String password);
}
abstract class AuthRepositoryPaciente{
    Future<UserModelPaciente> loginpaciente(String email, String password);
    Future<UserModelPaciente> registerpaciente(String name, String email, String password);
}