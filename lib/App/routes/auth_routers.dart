import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/identificador/identificador_page.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/login/login_clinica/login_bindings_clinica.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/login/login_clinica/login_page_clinica.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/login/login_paciente/login_bindings_paciente.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/login/login_paciente/login_page_paciente.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/register/register_clinica/register_bindings_clinica.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/register/register_clinica/register_page_clinica.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/register/register_paciente/register_bindings_paciente.dart';
import 'package:vakinha_burger_mobile/App/modules/auth/register/register_paciente/register_page_paciente.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/loginclinica',
      page: () => LoginPageClinica(),
      binding: LoginBindingsClinica(),
      ),
      GetPage(
      name: '/auth/registerclinica',
      binding: RegisterBidingsClinica(),
      page: () => RegisterPageClinica(),
      ),
      GetPage(
        name: '/auth/identificador',
        page: () => IdentificadorPage()
        ),
      GetPage(
        name: '/auth/loginpaciente', 
        binding: LoginBindingsPaciente(),
        page: () => LoginPagePaciente()
        ),
      GetPage(
        name: '/auth/registerpaciente',
        binding: RegisterBindingsPaciente(),
        page: () => RegisterPagePaciente()
        ),
  ];
}