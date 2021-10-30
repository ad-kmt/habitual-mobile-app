import 'dart:ui';

class AppTextStyles {
  AppTextStyles._();

  ///HEADINGS
  static final TextStyle h1 =
      TextStyle(fontSize: 40, height: 40, fontWeight: FontWeight.w500);
  static final TextStyle h2 =
      TextStyle(fontSize: 32, height: 36, fontWeight: FontWeight.w500);
  static final TextStyle h3 =
      TextStyle(fontSize: 28, height: 32, fontWeight: FontWeight.w500);
  static final TextStyle h4 =
      TextStyle(fontSize: 20, height: 24, fontWeight: FontWeight.w500);
  static final TextStyle h5 =
      TextStyle(fontSize: 16, height: 20, fontWeight: FontWeight.w500);
  static final TextStyle h6 =
      TextStyle(fontSize: 12, height: 12, fontWeight: FontWeight.w500);

  ///TEXT
  static final TextStyle bodyLarge =
      TextStyle(fontSize: 20, height: 24, fontWeight: FontWeight.w400);
  static final TextStyle bodyRegular =
      TextStyle(fontSize: 16, height: 20, fontWeight: FontWeight.w400);
  static final TextStyle bodySmall =
      TextStyle(fontSize: 12, height: 16, fontWeight: FontWeight.w400);
  static final TextStyle bodySmallBold =
      TextStyle(fontSize: 12, height: 16, fontWeight: FontWeight.w600);
  static final TextStyle label =
      TextStyle(fontSize: 12, height: 12, fontWeight: FontWeight.w600);
  static final TextStyle hint =
      TextStyle(fontSize: 10, height: 16, fontWeight: FontWeight.w500);

  ///INTERACTIONS
  static final TextStyle linkRegular = TextStyle(
      fontSize: 16,
      height: 20,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
  static final TextStyle linkSmall = TextStyle(
      fontSize: 12,
      height: 16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
  static final TextStyle strikeRegular = TextStyle(
      fontSize: 16,
      height: 16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.lineThrough);
  static final TextStyle strikeSmall = TextStyle(
      fontSize: 12,
      height: 12,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.lineThrough);

  static final TextStyle pillRegular =
      TextStyle(fontSize: 16, height: 16, fontWeight: FontWeight.w500);
  static final TextStyle pillSmall =
      TextStyle(fontSize: 12, height: 12, fontWeight: FontWeight.w500);
}
