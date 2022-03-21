import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/modules/home/Home_bindings.dart';
import 'package:vakinha_burger_mobile/App/modules/home/Home_page.dart';


class HomeRouters{

  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/home',binding: HomeBindings(), 
    page: () => const MenuPage() )
  ];
}