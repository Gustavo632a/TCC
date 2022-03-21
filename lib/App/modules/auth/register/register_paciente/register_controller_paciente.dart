import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/App/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/App/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/App/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/App/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.dart';

class RegisterControllerPaciente extends GetxController 
with LoaderMixin, MessagesMixin{
  final AuthRepositoryPaciente _authRepositoryPaciente;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterControllerPaciente({
    required AuthRepositoryPaciente authRepositoryPaciente,
    }) : _authRepositoryPaciente = authRepositoryPaciente;

    @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> registerpaci({
    required String name,
    required String email,
    required String password,
    
  })async {

      try {
        _loading.toggle();
        
        final userLogged = await _authRepositoryPaciente.registerpaciente(name, email, password);
        _loading.toggle();

        GetStorage().write(Constants.USER_KEY, userLogged.id);

      } on RestClientException catch (e, s) {
        _loading.toggle();
        log('Erro ao registrar usuário', error: e, stackTrace: s);
         _message(MessageModel(
          title: 'Erro', 
          message: e.message, 
          type: MessageType.error
          ));
      } catch (e, s) {
         _loading.toggle();
        log('Erro ao registrar usuário', error: e, stackTrace: s);
         _message(MessageModel(
          title: 'Erro', 
          message: 'Erro ao registrar usuário', 
          type: MessageType.error
          ));


      }
    
    }

}