import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/register/register_medico/register_page_medico.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.impl.dart';

class RegisterBindingsMedico implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepositoryClinica>(
      () => AuthRepositoryImplClinica(restClient: Get.find() 
      ),
      );

      Get.lazyPut(
        () => RegisterControllerMedico(authRepositoryMedico: Get.find())
      );
  }
}
