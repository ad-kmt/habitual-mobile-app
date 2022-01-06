import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/my_app/my_app_controller.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:habitual/data/repository/profile/edit_profile_repository.dart';

class EditProfileController extends GetxController {
  final EditProfileRepository editProfileRepository;
  final MyAppController myAppController = Get.find();

  EditProfileController({required this.editProfileRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    firstNameController.text = myAppController.user?.firstName ?? "";
    lastNameController.text = myAppController.user?.lastName ?? "";
    emailController.text = myAppController.user?.email ?? "";
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  String? firstNameValidator(String? val) {
    return val!.isEmpty ? "Enter first name" : null;
  }

  updateProfile() async {
    log("Validating form");
    if (formKey.currentState!.validate()) {
      log("Form Validated. Updating profile");
      log("First name: ${firstNameController.text} Last name: ${lastNameController.text}");

      UserModel user = myAppController.user!;
      user.firstName = firstNameController.text;
      user.lastName = lastNameController.text;
      bool result = await editProfileRepository.updateUser(user);
      // log(result.toString());
      if (result) {
        log(result.toString());
        Get.back();
        Get.snackbar(
            'Hi ${user.firstName}', 'Your profile is updated successfully');
      } else {
        Get.snackbar(
            'Alert!', 'Failed to update profile. Please contact developers.');
      }
    }
  }
}
