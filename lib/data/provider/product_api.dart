import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habitual/data/models/product_model.dart';

class ProductApiClient {
  //collection reference
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

//  _productsFromQuerySnaphot(
//     QuerySnapshot productQuerySnapshot) {
//   List<ProductModel> products = new List.empty();
//   productQuerySnapshot.docs.forEach((product) {
//     print(product);
//   });
// }
//
//  getAllProducts() async {
//   QuerySnapshot productQuerySnaphot = await productCollection.get();
//   _productsFromQuerySnaphot(productQuerySnaphot);
// }

  List<ProductModel> _productsFromSnaphot(QuerySnapshot querySnapshot) {
    List<ProductModel> products = [];
    for (var product in querySnapshot.docs) {
      products.add(
        ProductModel(
          id: product.id,
          name: product.get('name'),
          actualPrice: product.get('actualPrice').toDouble(),
          sellingPrice: product.get('sellingPrice').toDouble(),
          description: product.get('description'),
          rating: product.get('rating').toDouble(),
          image: product.get('image'),
        ),
      );
    }
    // log("products size: " + products.length.toString());
    return products;
  }

  Stream<List<ProductModel>> getAllProducts() {
    // log("Getting product data stream");
    return productCollection.snapshots().map(_productsFromSnaphot);
  }

  Future<List<ProductModel>> searchProducts(String name) async {
    QuerySnapshot querySnapshot = await productCollection
        .where("searchKeywords", arrayContains: name)
        .get();

    return _productsFromSnaphot(querySnapshot);
  }
}
