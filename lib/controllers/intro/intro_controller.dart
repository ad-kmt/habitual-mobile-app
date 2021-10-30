import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  final _currentPage = 0.obs;

  get currentPage => _currentPage.value;
  set currentPage(val) => _currentPage.value = val;
}
