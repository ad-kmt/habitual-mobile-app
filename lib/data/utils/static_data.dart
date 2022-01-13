import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';

class StaticData {
  static ProductModel productHeadphone = ProductModel(
      name: "Bose Headphone",
      sellingPrice: 69.99,
      rating: 4.5,
      actualPrice: 79.99,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      imageSrc: Assets.productImageHeadphone,
      isStaffPick: true);

  static ProductModel productLaptop = ProductModel(
      name: "Macbook Air",
      sellingPrice: 999,
      rating: 4.8,
      actualPrice: 1499,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      imageSrc: Assets.productImageLaptop,
      isStaffPick: true);

  static ProductModel productVR = ProductModel(
      name: "Oculus VR Headset",
      sellingPrice: 599,
      rating: 3.9,
      actualPrice: 799,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      imageSrc: Assets.productImageVR,
      isStaffPick: true);

  static ProductModel productIphone = ProductModel(
      name: "Iphone 13 Pro",
      sellingPrice: 1299,
      rating: 4.4,
      actualPrice: 1299,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      imageSrc: Assets.productImageIphone,
      isStaffPick: true);

  static ProductModel productController = ProductModel(
      name: "Xbox Controller",
      sellingPrice: 159,
      rating: 3.4,
      actualPrice: 199,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      imageSrc: Assets.productImageController,
      isStaffPick: true);

  static ProductModel productAirpods = ProductModel(
      name: "Apple airpods",
      sellingPrice: 229,
      rating: 3.8,
      actualPrice: 249,
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      category: "Category",
      imageSrc: Assets.productImageAirpods,
      isStaffPick: true);

  static List<ProductModel> products = [
    productHeadphone,
    productIphone,
    productController,
    productLaptop,
    productVR,
    productAirpods
  ];
}
