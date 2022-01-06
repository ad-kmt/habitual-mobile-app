import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/my_app/my_app_controller.dart';
import 'package:habitual/data/repository/registration/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;

  LoginController({required this.loginRepository});

  final MyAppController myAppController = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void loginWithEmailAndPassword() async {
    log("Validating login form");
    if (formKey.currentState!.validate()) {
      log("Login form Validated. Logging in now");
      log("Email: ${emailController.text} Pass: ${passwordController.text}");
      String? userId = await loginRepository.loginWithEmailAndPass(
          emailController.text, passwordController.text);
      // log(result.toString());
      if (userId != null) {
        Get.back();
        Get.snackbar('Hi!', 'Welcome back!');
      } else {
        Get.snackbar('Alert!', 'Login failed. Please contact developers.');
      }
    }
  }
}
