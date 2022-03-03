import 'package:habitual/data/models/product_model.dart';

class CartModel {
  ProductModel product;
  int quantity;

  CartModel(this.product, this.quantity);
}
