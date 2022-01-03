import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/auth/auth_controller.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/registration/signup_repository.dart';
import 'package:habitual/routes/app_pages.dart';

class SignUpController extends GetxController {
  AuthController authController = Get.find();

  final SignUpRepository signUpRepository;

  //form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpController({required this.signUpRepository});

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    emailController.text = 'foo@foo.com';
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? passwordValidator(String? val) {
    return val!.length < 6 ? "Enter password 6+ chars long" : null;
  }

  String? emailValidator(String? val) {
    return val!.isEmpty ? "Enter an email" : null;
  }

  String? firstNameValidator(String? val) {
    return val!.isEmpty ? "Enter first name" : null;
  }

  void signUpWithEmailAndPassword() async {
    log("Validating email and password");
    if (formKey.currentState!.validate()) {
      log("Email and Password Validated. Signing up now");
      log("Email: ${emailController.text} Pass: ${passwordController.text}");
      UserModel? result = await authController.registerWithEmailAndPass(
          emailController.text, passwordController.text);
      // log(result.toString());
      if (result != null) {
        result.firstName = firstNameController.text;
        result.lastName = lastNameController.text;
        result.email = emailController.text;
        log(result.toString());
        bool userCreationStatus = await signUpRepository.createUser(result);
        if (userCreationStatus) {
          Get.offAllNamed(Routes.MY_APP);
          Get.snackbar(
              'Signup', 'Signup successful. Welcome ${result.firstName}!');
        } else {
          Get.snackbar(
              'Signup', 'Failed to create user. Please contact developers');
        }
      } else {
        Get.snackbar('Signup', 'Signup failed');
      }
    }
  }
}
