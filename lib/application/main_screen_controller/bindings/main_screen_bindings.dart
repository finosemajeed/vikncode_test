import 'package:get/get.dart';
import 'package:vikncode_test/application/main_screen_controller/controller/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController());
  }
}
