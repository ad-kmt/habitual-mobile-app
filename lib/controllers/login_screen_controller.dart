import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/global/auth_controller.dart';
import 'package:habitual/data/repository/login_repository.dart';

class LoginScreenController extends GetxController {
  final LoginRepository loginRepository;
  final AuthController authController = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreenController({required this.loginRepository});

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
      String? userId = await authController.loginWithEmailAndPass(
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
