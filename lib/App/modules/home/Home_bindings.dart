import 'package:get/get.dart';
import 'package:Change/App/modules/Home/Home_controller.dart';

class HomeBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(HomeController());
    }
}