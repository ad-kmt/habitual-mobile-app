import 'package:habitual/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  String id;
  String name;
  String? image;
  double sellingPrice;
  int quantity;
  String productId;

  CartItemModel.fromProductModel(this.id, ProductModel product, this.quantity)
      : name = product.name,
        sellingPrice = product.sellingPrice,
        image = product.image,
        productId = product.id;

  CartItemModel({
    required this.id,
    required this.name,
    required this.sellingPrice,
    this.image,
    required this.quantity,
    required this.productId,
  });

  @override
  String toString() {
    return 'CartItemModel{id: $id, name: $name, quantity: $quantity, productId: $productId}';
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
