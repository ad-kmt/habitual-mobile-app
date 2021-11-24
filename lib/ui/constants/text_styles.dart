import 'dart:ui';
import 'package:flutter/material.dart';

class AppTextStyles {
  ///HEADINGS
  static const TextStyle h1 =
      TextStyle(fontSize: 40, height: 40/40, fontWeight: FontWeight.w500);
  static const TextStyle h2 =
      TextStyle(fontSize: 32, height: 36/32, fontWeight: FontWeight.w500);
  static const TextStyle h3 =
      TextStyle(fontSize: 28, height: 32/28, fontWeight: FontWeight.w500);
  static const TextStyle h4 =
      TextStyle(fontSize: 20, height: 24/20, fontWeight: FontWeight.w500);
  static const TextStyle h5 =
      TextStyle(fontSize: 16, height: 20/16, fontWeight: FontWeight.w500);
  static const TextStyle h6 =
      TextStyle(fontSize: 12, height: 12/12, fontWeight: FontWeight.w500);

  ///TEXT
  static const TextStyle bodyLarge =
      TextStyle(fontSize: 20, height: 24/20, fontWeight: FontWeight.w400);
  static const TextStyle bodyRegular =
      TextStyle(fontSize: 16, height: 20/16, fontWeight: FontWeight.w400);
  static const TextStyle bodySmall =
      TextStyle(fontSize: 12, height: 16/12, fontWeight: FontWeight.w400);
  static const TextStyle bodySmallBold =
      TextStyle(fontSize: 12, height: 16/12, fontWeight: FontWeight.w700);
  static const TextStyle label =
      TextStyle(fontSize: 12, height: 12/12, fontWeight: FontWeight.w600);
  static const TextStyle hint =
      TextStyle(fontSize: 10, height: 16/10, fontWeight: FontWeight.w500);

  ///INTERACTIONS
  static const TextStyle linkRegular = TextStyle(
      fontSize: 16,
      height: 20/16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
  static const TextStyle linkSmall = TextStyle(
      fontSize: 12,
      height: 16/12,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
  static const TextStyle strikeRegular = TextStyle(
      fontSize: 16,
      height: 16/16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.lineThrough);
  static const TextStyle strikeSmall = TextStyle(
      fontSize: 12,
      height: 12/12,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.lineThrough);
  static const TextStyle pillRegular =
      TextStyle(fontSize: 16, height: 16/16, fontWeight: FontWeight.w500);
  static const TextStyle pillSmall =
      TextStyle(fontSize: 12, height: 12/12, fontWeight: FontWeight.w500);
}
