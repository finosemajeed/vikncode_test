part of "app_pages.dart";

abstract class Routes {
  Routes._();

  static const LOGIN_SCREEN = _Paths.LOGIN_SCREEN;
  static const MAIN_SCREEN = _Paths.MAIN_SCREEN;
}

abstract class _Paths {
  _Paths._();

  static const LOGIN_SCREEN = '/login_screen';
  static const MAIN_SCREEN = '/main_screen';
}
