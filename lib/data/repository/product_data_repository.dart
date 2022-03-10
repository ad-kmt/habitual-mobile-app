import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/data/provider/product_api.dart';

class ProductDataRepository {
  ProductApiClient productApiClient;

  ProductDataRepository({required this.productApiClient});

  Stream<List<ProductModel>> getAllProducts() {
    return productApiClient.getAllProducts();
  }

  Future<List<ProductModel>> searchProducts(String name) {
    return productApiClient.searchProducts(name);
  }
}
