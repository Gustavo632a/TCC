import 'package:get/get.dart';
import 'package:Change/App/modules/auth/register/register_clinica/register_controller_clinica.dart';
import 'package:Change/App/repositories/auth/auth_repository.dart';
import 'package:Change/App/repositories/auth/auth_repository.impl.dart';

class RegisterBidingsClinica implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepositoryClinica>(
      () => AuthRepositoryImplClinica(restClient: Get.find() 
      ),
      );

      Get.lazyPut(
        () => RegisterControllerClinica(authRepositoryClinica: Get.find())
      );
  }
}
