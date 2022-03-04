import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/data/repository/product_data_repository.dart';

class ProductDataController extends GetxController {
  ProductDataRepository productDataRepository;

  ProductDataController({required this.productDataRepository});

  final RxList<ProductModel> _products = <ProductModel>[].obs;

  RxList<ProductModel> get products => _products;

  set products(val) => _products.value = val;

  @override
  void onInit() {
    _products.bindStream(productDataRepository.getAllProducts());
    ever(
        _products, (prods) => {log("products: " + products.length.toString())});
    super.onInit();
  }
}
