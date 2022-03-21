import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/core/ui/change_ui.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_appbar.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_button.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_state.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_textformfield.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/login/login_paciente/login_controller_paciente.dart';
import 'package:validatorless/validatorless.dart';

class LoginPagePaciente extends StatefulWidget {

  const LoginPagePaciente({Key? key}) : super(key: key);

  @override
  State<LoginPagePaciente> createState() => _LoginPageState();
}

class _LoginPageState extends ChangeState<LoginPagePaciente, LoginControllerPaciente> {

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChangeAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(constraints:
              BoxConstraints(minHeight: constraints.maxHeight,
              
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Form(
                    key: _formKey,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Login',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark
                    ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ChangeTextformfield(label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório'),
                      Validatorless.email('E-mail Inválido')
                    ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ChangeTextformfield(label: 'Senha',
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatório'),
                      Validatorless.min(6,'Senha deve conter pelo menos 6 Caracteres'),
                    ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ChangeButton(
                        width: double.infinity,
                        label: 'ENTRAR',
                        onPressed: () {
                          final formValid = _formKey.currentState?.validate() ?? false;
                          if(formValid) {
                            controller.login(email: _emailEC.text, password: _passwordEC.text);
                          }

                        },),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não possui uma conta?'),
                        TextButton(onPressed: (){
                          Get.toNamed('/auth/registerpaciente');
                        }, child:  const Text(
                          'Cadastre-se',
                          style: ChangeUI.textBold,
                        ))
                      ],
                    )
                  ],
                ),
                ),
                ),
              )
             ),
          );
        },
      ),
    );
  }
}