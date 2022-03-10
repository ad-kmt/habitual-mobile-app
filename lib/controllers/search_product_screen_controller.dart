import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/global/product_controller.dart';
import 'package:habitual/data/models/product_model.dart';

class SearchProductScreenController extends GetxController {
  final searchFieldController = TextEditingController();
  final FocusNode searchFieldFocus = FocusNode();
  final ProductDataController productDataController = Get.find();

  bool isTyping = false;
  bool isSearching = true;
  bool isSubmitted = false;

  List<ProductModel> searchProductResults = [];

  @override
  void onInit() {
    super.onInit();
    searchFieldController.addListener(_updateTypingState);
    searchFieldFocus.addListener(_onFocusChange);
  }

  Future<void> _updateTypingState() async {
    String searchText = searchFieldController.text;
    isTyping = searchFieldController.text.isEmpty ? false : true;
    if (searchText.isEmpty) {
      isTyping = false;
      searchProductResults = [];
    } else {
      isTyping = true;
      searchProductResults = await productDataController
          .searchProducts(searchFieldController.text);
      log(searchProductResults.toString());
    }
    update();
  }

  void _onFocusChange() {
    if (searchFieldFocus.hasFocus) {
      log("Focussed");
      isSearching = true;
      isSubmitted = false;
    } else {
      log("Not focussed");
      isSearching = false;
    }
    update();
  }

  onSubmitHandler() {
    isSubmitted = true;
    isSearching = false;
    update();
  }

  suggestedSearchItemClickHandler(String suggestedSearchText) async {
    searchFieldController.text = suggestedSearchText.toLowerCase();
    isTyping = true;
    searchProductResults =
        await productDataController.searchProducts(searchFieldController.text);
    searchFieldFocus.unfocus();
    isSearching = false;
    isSubmitted = true;
  }
}
