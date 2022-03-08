import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String id;
  String name;
  double sellingPrice;
  double actualPrice;
  late double discount;
  String description;
  double? rating;
  String category;
  bool isStaffPick;
  String? image;

  ProductModel(
      {required this.id,
      required this.name,
      required this.sellingPrice,
      required this.actualPrice,
      this.description = "",
      this.rating,
      this.category = "",
      this.isStaffPick = false,
      this.image}) {
    if (sellingPrice == actualPrice) {
      discount = 0;
    } else {
      discount = ((actualPrice - sellingPrice) / actualPrice) * 100;
    }
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, name: $name}';
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
