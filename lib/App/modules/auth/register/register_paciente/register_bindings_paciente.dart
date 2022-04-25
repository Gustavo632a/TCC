import 'package:get/get.dart';
import 'package:Change/App/modules/auth/register/register_paciente/register_controller_paciente.dart';
import 'package:Change/App/repositories/auth/auth_repository.dart';
import 'package:Change/App/repositories/auth/auth_repository.impl.dart';

class RegisterBindingsPaciente implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepositoryPaciente>(
      () => AuthRepositoryImplPaciente(restClient: Get.find() 
      ),
      );

      Get.lazyPut(
        () => RegisterControllerPaciente(authRepositoryPaciente: Get.find())
      );
  }
}
