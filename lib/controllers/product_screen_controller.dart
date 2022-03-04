import 'package:get/get.dart';

class ProductScreenController extends GetxController {
  final _currentPage = 0.obs;

  get currentPage => _currentPage.value;

  set currentPage(val) => _currentPage.value = val;

  final _isProductInCart = false.obs;

  get isProductInCart => _isProductInCart.value;

  set isProductInCart(val) => _isProductInCart.value = val;
}
