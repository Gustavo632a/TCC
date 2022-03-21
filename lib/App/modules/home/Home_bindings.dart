import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/modules/Home/Home_controller.dart';

class HomeBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(HomeController());
    }
}