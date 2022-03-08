import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchProductScreenController extends GetxController {
  final searchFieldController = TextEditingController();

  bool isTyping = false;

  @override
  void onInit() {
    super.onInit();
    searchFieldController.addListener(_updateState);
  }

  void _updateState() {
    log(searchFieldController.text);
    isTyping = searchFieldController.text.isEmpty ? false : true;
    log(isTyping.toString());
    update();
  }
}
