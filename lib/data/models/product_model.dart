import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

/// TODO: make fields private, mention required fields in constructor
@JsonSerializable()
class ProductModel {
  String name;
  double sellingPrice;
  double actualPrice;
  late double discount;
  String description;
  double? rating;
  String category;
  bool isStaffPick;
  String? imageSrc;

  ProductModel(
      {required this.name,
      required this.sellingPrice,
      required this.actualPrice,
      this.description = "",
      this.rating,
      this.category = "",
      this.isStaffPick = false,
      this.imageSrc}) {
    if (sellingPrice == actualPrice) {
      discount = 0;
    } else {
      discount = ((actualPrice - sellingPrice) / actualPrice) * 100;
    }
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
