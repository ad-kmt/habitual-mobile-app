import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroController extends GetxController {
  final _currentPage = 0.obs;

  get currentPage => _currentPage.value;
  set currentPage(val) => _currentPage.value = val;
}
