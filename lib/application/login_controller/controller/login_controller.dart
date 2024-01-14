import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikncode_test/domain/model/login_request_model.dart';
import 'package:vikncode_test/domain/routes/app_pages.dart';
import 'package:vikncode_test/infrastracture/login_repository.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool obscurePassword = false.obs;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  onLoginClick() async {
    if (!formKey.currentState!.validate()) return;

    final inputUsername = usernameController.text.trim();
    final inputPassword = passwordController.text;
    isLoading.value = true;

    final userModel = LoginRequestModel(
      isMobile: true,
      username: inputUsername,
      password: inputPassword,
    );
    try {
      final user = await LoginRepository().userLogin(userModel);
      if (user.success == 6000) {
        Get.snackbar(
          'Success',
          '${user.message}',
          backgroundColor: Colors.white,
          colorText: Colors.black,
          titleText: const Text(
            'Success',
            style: TextStyle(color: Colors.green),
          ),
        );
        Get.offNamed(Routes.MAIN_SCREEN);
        isLoading.value = false;
      } else {
        Get.snackbar(
          'Error',
          '${user.error}',
          backgroundColor: Colors.white,
          colorText: Colors.black,
          titleText: const Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
        );
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        titleText: const Text(
          'Error',
          style: TextStyle(color: Colors.red),
        ),
      );
      isLoading.value = false;
    }
  }

  showPassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
