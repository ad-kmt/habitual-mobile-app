import 'package:habitual/data/models/product_model.dart';

class StaticData {
  static ProductModel productHeadphone = ProductModel(
      name: "Bose Headphone",
      sellingPrice: 69.99,
      rating: 4.5,
      actualPrice: 79.99,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      isStaffPick: true);

  static ProductModel productLaptop = ProductModel(
      name: "Macbook Air",
      sellingPrice: 999,
      rating: 4.8,
      actualPrice: 1499,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      isStaffPick: true);
}
