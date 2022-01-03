import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroController extends GetxController {
  final _currentPage = 0.obs;

  get currentPage => _currentPage.value;

  set currentPage(val) => _currentPage.value = val;

  final _loading = true.obs;

  get loading => _loading.value;

  set loading(val) => _loading.value = val;

  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    log("Intro seen status: " + _seen.toString());

    await Future.delayed(Duration(milliseconds: 500));

    if (_seen) {
      log("Going to HOME page");
      Get.offNamed(Routes.MY_APP);
    } else {
      await prefs.setBool('seen', true);
      log("Load INTRO page");
      loading = false;
    }
  }

  @override
  Future<void> onInit() async {
    await checkFirstSeen();
    super.onInit();
  }
}
