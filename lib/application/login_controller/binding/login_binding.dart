
import 'package:get/get.dart';
import 'package:vikncode_test/application/login_controller/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}