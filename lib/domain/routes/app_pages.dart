// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:vikncode_test/application/login_controller/binding/login_binding.dart';
import 'package:vikncode_test/application/main_screen_controller/bindings/main_screen_bindings.dart';
import 'package:vikncode_test/presentation/login_screen/login_screen.dart';
import 'package:vikncode_test/presentation/main_screen/main_screen.dart';

part "app_routes.dart";

class AppPages {
  AppPages._();

  static const INTIAL = Routes.LOGIN_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    )
  ];
}
