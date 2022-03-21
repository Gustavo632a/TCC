import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/login/login_paciente/login_controller_paciente.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.impl.dart';

class LoginBindingsPaciente implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepositoryPaciente>(
      () => AuthRepositoryImplPaciente(restClient: Get.find() 
      ),
      );

      Get.lazyPut(
        () => LoginControllerPaciente(authRepository: Get.find())
      );
  }
}