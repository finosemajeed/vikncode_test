import 'package:get/get.dart';
import 'package:vikncode_test/application/login_controller/binding/login_binding.dart';
import 'package:vikncode_test/presentation/login_screen/login_screen.dart';

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
      name: _Paths.m,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    )

  ];
}
