import 'package:habitual/data/models/product_model.dart';

class StaticData {
  static ProductModel productModel = ProductModel(
      productName: "Product Name",
      sellingPrice: 69.99,
      actualPrice: 79.99,
      productDescription:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      isStaffPick: true);
}
