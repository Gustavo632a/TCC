import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/login/login_clinica/login_controller_clinica.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/App/repositories/auth/auth_repository.impl.dart';

class LoginBindingsClinica implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepositoryClinica>(
      () => AuthRepositoryImplClinica(restClient: Get.find() 
      ),
      );

      Get.lazyPut(
        () => LoginControllerClinica(authRepository: Get.find())
      );
  }
}