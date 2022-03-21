import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/App/modules/home/Home_page.dart';
import 'package:vakinha_burger_mobile/App/modules/menu/menu_page.dart';

class HomeController extends GetxController {

  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu','/order/shopping_cart','/exit'];

  int get tabIndex => _tabIndex.value;

  set tabIndex( int index){
    _tabIndex(index);
    if(_tabs[index] == '/exit' ){
      Get.find<AuthService>().logout();
    }else{
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY );
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {

    if(settings.name == '/menu'){
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }

    if(settings.name == '/order/shopping_card'){

    }


  }

}