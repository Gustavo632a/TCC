
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/App/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/App/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/App/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/App/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.dart';
import 'package:http/http.dart' as http;

class RegisterControllerClinica extends GetxController
with LoaderMixin, MessagesMixin{
  var dados;
  var name, cnpj, email, bairro, rua, cep, telefone, password;

  _listarDados() async {
    // const url = "http://10.10.25.65/change/clinica/listar_clinica.php";
    final response = await http.get(Uri.parse("http://10.10.25.65/change/clinica/listar_clinica.php"));
    final map = json.decode(response.body);
    final itens = map["result"];

    this.dados = itens;
  }

  final AuthRepositoryClinica _authRepositoryClinica;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterControllerClinica({
    required AuthRepositoryClinica authRepositoryClinica,
    }) : _authRepositoryClinica = authRepositoryClinica;

    @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

   Future<void> registerclini({
     required String name,
     required String cnpj,
     required String email,
     required String bairro,
     required String rua,
     required String cep,
     required String telefone,
     required String password,
    
   })
  
  async {

      try {
        _loading.toggle();
        
        final userLogged = await _authRepositoryClinica.registerclinica(name, cnpj, email, bairro , cep, telefone, rua, password);
        GetStorage().write(Constants.USER_KEY, userLogged.id);

      } on RestClientException catch (e, s) {
        _loading.toggle();
        log('Erro ao registrar clínica', error: e, stackTrace: s);
         _message(MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error
          ));
          _loading.toggle();
        log('Erro ao registrar clínica', error: e, stackTrace: s);
         _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar clínica',
          type: MessageType.error
          ));
      }
  }
}