
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Change/App/core/ui/widgets/change_appbar.dart';
import 'package:Change/App/core/ui/widgets/change_button.dart';
import 'package:Change/App/core/ui/widgets/change_state.dart';
import 'package:Change/App/core/ui/widgets/change_textformfield.dart';
import 'package:Change/App/modules/auth/register/register_paciente/register_controller_paciente.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPagePaciente extends StatefulWidget{
  const RegisterPagePaciente ({ Key? key}) : super (key: key);

  @override
  State<RegisterPagePaciente> createState() => _RegisterPagePacienteState();
}

class _RegisterPagePacienteState 
extends ChangeState<RegisterPagePaciente, RegisterControllerPaciente> {

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _cpfEC = TextEditingController();
  final _telefoneEC = TextEditingController();
  final _rgEC = TextEditingController();
  final _dateEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
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
                  Text('Preencha os campos abaixo para criar o seu cadastro:',
                  style: context.textTheme.bodyText1
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigat??rio'),
                    ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'RG',
                    controller: _rgEC,
                    validator: Validatorless.required('RG Obrigat??rio'),
                    ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'CPF',
                    controller: _cpfEC,
                    validator: Validatorless.required('CPF Obrigat??rio'),
                    ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Data de nascimento',
                    controller: _dateEC,
                    validator: Validatorless.multiple([
                    Validatorless.required('Data de nascimento Obrigat??rio'),
                    Validatorless.date('Data inv??lida'),
                    ],
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'Telefone',
                    controller: _telefoneEC,
                    validator: Validatorless.required('Telefone Obrigat??rio'),
                    ),
                  const SizedBox(
                    height: 27,
                  ),
                  ChangeTextformfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigat??rio'),
                      Validatorless.email('E-mail Inv??lido')
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
                      Validatorless.compare(_passwordEC, 'Senha Diferente de confirma senha')
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
                          controller.registerpaci(
                            name: _nameEC.text, 
                            email: _emailEC.text,
                            cpf: _cpfEC.text,
                            rg: _rgEC.text,
                            telefone: _telefoneEC.text,
                            date: _dateEC.text,
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