import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Change/App/core/bindings/application_binding.dart';
import 'package:Change/App/core/ui/change_ui.dart';
import 'package:Change/App/routes/auth_routers.dart';
import 'package:Change/App/routes/home_routers.dart';
import 'package:Change/App/routes/splash_routers.dart';

Future<void> main () async{
  await GetStorage.init();
  runApp(const ChangeMainApp());
}

class ChangeMainApp extends StatelessWidget {
  const ChangeMainApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return  GetMaterialApp(
      title: 'Change',
      theme: ChangeUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
      ],
    );
  }
}