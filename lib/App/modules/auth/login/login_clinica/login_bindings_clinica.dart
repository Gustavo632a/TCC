import 'package:get/get.dart';
import 'package:Change/App/modules/auth/login/login_clinica/login_controller_clinica.dart';
import 'package:Change/App/repositories/auth/auth_repository.dart';
import 'package:Change/App/repositories/auth/auth_repository.impl.dart';

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