import 'package:get/get.dart';
import 'package:Change/App/modules/home/Home_bindings.dart';
import 'package:Change/App/modules/home/Home_page.dart';


class HomeRouters{

  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/home',binding: HomeBindings(), 
    page: () => const MenuPage() )
  ];
}