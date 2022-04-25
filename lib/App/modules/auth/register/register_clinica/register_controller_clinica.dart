import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Change/App/core/constants/constants.dart';
import 'package:Change/App/core/mixins/loader_mixin.dart';
import 'package:Change/App/core/mixins/messages_mixin.dart';
import 'package:Change/App/core/rest_client/rest_client.dart';
import 'package:Change/App/repositories/auth/auth_repository.dart';

class RegisterControllerClinica extends GetxController
with LoaderMixin, MessagesMixin{

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
        
        final userLogged = await _authRepositoryClinica.registerclinica(name, cnpj, rua, cep, bairro, email, password);
        GetStorage().write(Constants.USER_KEY, userLogged.id);

      } on RestClientException catch (e, s) {
        _loading.toggle();
        log('Erro ao registrar clínica', error: e, stackTrace: s);
         _message(MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error
          ));
      }
  }
}