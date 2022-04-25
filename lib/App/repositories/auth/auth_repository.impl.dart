import 'dart:developer';
import 'package:Change/App/core/exceptions/user_notfound_exceptions.dart';
import 'package:Change/App/core/rest_client/rest_client.dart';
import 'package:Change/App/models/user_model.dart';
import 'package:Change/App/repositories/auth/auth_repository.dart';

class AuthRepositoryImplPaciente implements AuthRepositoryPaciente{
  final RestClient _restClient;

  AuthRepositoryImplPaciente({
    required RestClient restClient
    })
    :_restClient = restClient;

  @override
  Future<UserModelPaciente> registerpaciente(String name, String telefone, String date, String cpf, String rg, String email, String password) async {
    final result = await _restClient.post('/auth/registerpaciente', {
      'name': name,
      'email': email,
      'password': password
    });

    if(result.hasError) {
      var message = 'Erro ao registrar o usuário';
      if(result.statusCode == 400)  {
        message = result.body['Error'];
      }

      log(message, error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException(message);
    }

    return loginpaciente(email, password);
  }

  @override
  Future<UserModelPaciente> loginpaciente(String email, String password) async{
    final result = await _restClient.post('/auth/loginpaciente', {
      'email': email,
      'password': password,
    });

    if(result.hasError){
      if(result.statusCode == 403) {
        log('Usuario ou Senha Inválidos', error: result.statusText, stackTrace: StackTrace.current);
        
        throw UserNotFoundException();
      }

      log('Erro ao autenticar o usuário (${result.statusCode})',
      error: result.statusText,
      stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar o usuário');
    }

    return UserModelPaciente.fromMap(result.body);
  }
}
class AuthRepositoryImplClinica implements AuthRepositoryClinica{
  final RestClient _restClient;

  AuthRepositoryImplClinica({
    required RestClient restClient
    })
    :_restClient = restClient;

  @override
  Future<UserModelClinica> registerclinica(String name, String cnpj, String email, String password) async {
    final result = await _restClient.post('/auth/registerclinica', {
      'name': name,
      'email': email,
      'cnpj': cnpj,
      'password': password
    });

    if(result.hasError) {
      var message = 'Erro ao registrar clínica';
      if(result.statusCode == 400)  {
        message = result.body['Error'];
      }

      log(message, error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException(message);
    }

    return loginclinica(cnpj, password);
  }

  @override
  Future<UserModelClinica> loginclinica(String cnpj, String password) async{
    final result = await _restClient.post('/auth/loginclinica', {
      'cnpj': cnpj,
      'password': password,
    });

    if(result.hasError){
      if(result.statusCode == 403) {
        log('Cnpj ou Senha Inválidos', error: result.statusText, stackTrace: StackTrace.current);
        
        throw UserNotFoundException();
      }

      log('Erro ao autenticar a clínica (${result.statusCode})',
      error: result.statusText,
      stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar a clínica');
    }

    return UserModelClinica.fromMap(result.body);
  }
}