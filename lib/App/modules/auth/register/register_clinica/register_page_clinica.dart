import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Change/App/core/ui/widgets/change_appbar.dart';
import 'package:Change/App/core/ui/widgets/change_button.dart';
import 'package:Change/App/core/ui/widgets/change_state.dart';
import 'package:Change/App/core/ui/widgets/change_textformfield.dart';
import 'package:Change/App/modules/auth/register/register_clinica/register_controller_clinica.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPageClinica extends StatefulWidget{
  const RegisterPageClinica ({ Key? key}) : super (key: key);

  @override
  State<RegisterPageClinica> createState() => _RegisterPageStateClinica();
}

class _RegisterPageStateClinica
extends ChangeState<RegisterPageClinica, RegisterControllerClinica> {

  static const _baseUrl = 'https://change-e13d9-default-rtdb.firebaseio.com/';

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _cepEC = TextEditingController();
  final _telefoneEC = TextEditingController();
  final _ruaEC = TextEditingController();
  final _bairroEC = TextEditingController();
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
                  Text('Preencha os campos abaixo para criar o cadastro de sua cl??nica:',
                  style: context.textTheme.bodyText1
        
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Nome da cl??nica',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigat??rio'),
                    ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'CNPJ',
                    controller: _cnpjEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('CNPJ Obrigat??rio'),
                    ]
                    ),),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Bairro',
                    controller: _bairroEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Bairro Obrigat??rio'),
                    ]
                    ),),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Rua',
                    controller: _ruaEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Rua Obrigat??rio'),
                    ]
                    ),),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'CEP',
                    controller: _cepEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('CEP Obrigat??rio'),
                    ]
                    ),),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Telefone',
                    controller: _telefoneEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Telefone Obrigat??rio'),
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
                      Validatorless.required('Senha Obrigat??rio'),
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
                      Validatorless.required('Confirmar Senha Obrigat??rio'),
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
                            rua: _ruaEC.text,
                            bairro: _bairroEC.text,
                            cep: _cepEC.text,
                            telefone: _telefoneEC.text,
                            cnpj: _cnpjEC.text,
                            email: _emailEC.text, 
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