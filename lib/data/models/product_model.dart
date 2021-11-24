import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

/// TODO: make fields private, mention required fields in constructor
@JsonSerializable()
class ProductModel {

  String productName;
  double sellingPrice;
  double actualPrice;
  late double discount;
  String productDescription;
  double? rating;
  String category;
  bool isStaffPick;



  ProductModel({required this.productName, required this.sellingPrice, required this.actualPrice,
    this.productDescription="", this.rating, this.category="", this.isStaffPick=false}){
    if(sellingPrice == actualPrice){
      discount = 0;
    } else {
      discount = ((actualPrice - sellingPrice)/actualPrice)*100;
    }
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}