import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        color: const Color(0xFF4DBCE9),
        child: Stack(
          children: [
         const  Align(
             alignment: Alignment.center,
             child: Text(
               'Bem-vindo(a)!',
              textScaleFactor: 2,
             ),
           ),
           Align(
           alignment: Alignment.topCenter,
           child: Column(
              children: [
                SizedBox(
                  height: context.heightTransformer(reducedBy: 85)
                ),
                Image.asset('assets/images/Change-logo2.png'),
                const SizedBox(
                  height: 60,
                ),
                ChangeButton(
                label: 'ACESSAR', 
                width: context.widthTransformer(reducedBy: 40),
                height: 45,
                onPressed: () {
                  Get.toNamed('/auth/identificador');
                }
                ),
              ],
            ))
          ],
        ),
      )
    );
  }
}