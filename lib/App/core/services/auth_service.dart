import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Change/App/core/constants/constants.dart';

class AuthService extends GetxService {

  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    logout();
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      _isLogged(value != null );
    });
    ever<bool?>(_isLogged, (isLooged){
      if(isLooged == null || !isLooged){
        Get.offAllNamed('/auth/login');
      }else{
        Get.offAllNamed('/home');
      }
    });
    _isLogged(getUserId() != null);
    return this;
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);
  int? getUserId() => _getStorage.read(Constants.USER_KEY);
}