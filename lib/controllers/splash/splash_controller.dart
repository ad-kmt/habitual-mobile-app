import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    log(_seen.toString());

    await Future.delayed(Duration(milliseconds: 500));

    if (_seen) {
      Get.offNamed(Routes.SIGNUP_PROMPT);
    } else {
      await prefs.setBool('seen', true);
      Get.offNamed(Routes.INTRO);
    }
  }

  @override
  Future<void> onInit() async {
    await checkFirstSeen();
    super.onInit();
  }
}
