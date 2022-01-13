import 'package:cloud_firestore/cloud_firestore.dart';

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
}
