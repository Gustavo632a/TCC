import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_appbar.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_button.dart';

class IdentificadorPage extends StatefulWidget {
  const IdentificadorPage({ Key? key }) : super(key: key);

  @override
  State<IdentificadorPage> createState() => _IdentificadorPageState();
}

class _IdentificadorPageState extends State<IdentificadorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChangeAppbar(
      elevation: 0,
      ),
      body: Container (
        color: Colors.white,
          child: Padding(
          padding: const EdgeInsets.all(80.0),
        child: Stack(
          children: [
           Align(
             alignment: Alignment.topCenter,
             child: Text(
               'Escolha seu login:',
              textScaleFactor: 2,
             ),
           ),
        Align(
        alignment: Alignment.center,
        child: Column(
          children: [
          const SizedBox(
           height: 100,
            ),
            ChangeButton(
            label: 'CLÍNICA',
            width: context.widthTransformer(reducedBy: 40),
            height: 45,
            onPressed: () {
              Get.toNamed('/auth/loginclinica');
            }
            ),
            const SizedBox(
              height: 30,
            ),
            ChangeButton(
              label: 'PACIENTE',
              width: context.widthTransformer(reducedBy: 40),
              height: 45,
              onPressed: () {
                Get.toNamed('/auth/loginpaciente');
              })
          ],
        ),
        )  
          ]
    ),
    )
      ),
    );
  }
}