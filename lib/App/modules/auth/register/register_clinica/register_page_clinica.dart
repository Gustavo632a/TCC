import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_appbar.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_button.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_state.dart';
import 'package:vakinha_burger_mobile/App/core/ui/widgets/change_textformfield.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/register/register_clinica/register_controller_clinica.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPageClinica extends StatefulWidget{
  const RegisterPageClinica ({ Key? key}) : super (key: key);

  @override
  State<RegisterPageClinica> createState() => _RegisterPageStateClinica();
}

class _RegisterPageStateClinica
extends ChangeState<RegisterPageClinica, RegisterControllerClinica> {

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _cnpjEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _cnpjEC.dispose();
    _nameEC.dispose();
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
      body: SingleChildScrollView( 
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child:Form(
                  key: _formKey,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Cadastro',
                  style: context.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark
                  ),
                  ),
                  Text('Preencha os campos abaixo para criar o cadastro de sua clínica:',
                  style: context.textTheme.bodyText1
            
        
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Nome da clínica',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                    ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'CNPJ',
                    controller: _cnpjEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('CNPJ Obrigatório'),
                    ]
                    ),),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório'),
                      Validatorless.email('E-mail Inválido')
                    ]
                    ),),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Senha',
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Password Obrigatório'),
                      Validatorless.min(6, 'Senha deve conter pelo menos 6 caracteres')
                    ]
                    ),
                    ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Confirmar Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmar Senha Obrigatório'),
                      Validatorless.compare(_passwordEC, 'Senha Diferente de confirmar senha')
                    ]
                    ),),
                  const SizedBox(
                    height: 27,
                  ),
                  Center(
                    child: ChangeButton(
                      width: double.infinity,
                      label: 'Cadastrar',
                      onPressed: () {
                        final formValid =  _formKey.currentState?.validate() ?? false;
                        if(formValid) {
                          controller.registerclini(
                            name: _nameEC.text, 
                            email: _emailEC.text, 
                            cnpj: _cnpjEC.text,
                            password: _passwordEC.text);
                        }
                      },
                      ) 
                  ),
                ],
              ),
              ),
              ),
            )
      )
    );
  }
}