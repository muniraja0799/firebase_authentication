import 'package:get/get.dart';

import 'package:firebase_authentication/app/modules/home/bindings/home_binding.dart';
import 'package:firebase_authentication/app/modules/home/views/home_view.dart';
import 'package:firebase_authentication/app/modules/login/bindings/login_binding.dart';
import 'package:firebase_authentication/app/modules/login/views/login_view.dart';
import 'package:firebase_authentication/app/modules/register/bindings/register_binding.dart';
import 'package:firebase_authentication/app/modules/register/views/register_view.dart';
import 'package:firebase_authentication/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:firebase_authentication/app/modules/welcome/views/welcome_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
