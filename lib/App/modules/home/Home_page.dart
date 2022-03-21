import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/App/modules/menu/widgets/product_tile.dart';
import 'package:vakinha_burger_mobile/App/modules/menu/menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: controller.represhPage,
        child: ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            final prod = controller.menu[index];
            return ProductTile(product: prod);
          },
        ),
      );
    });
  }
}