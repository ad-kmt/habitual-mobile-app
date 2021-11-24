import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppShadows {

  static List<BoxShadow> cardShadowMedium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 1,
      offset: const Offset(0, 0),
    ),
  ];

  static List<BoxShadow> cardShadowLarge = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 24,
      offset: const Offset(0, 16),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 1,
      offset: const Offset(0, 0),
    ),
  ];

  static List<BoxShadow> buttonShadowDefault = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 15,
      offset: const Offset(0, 5),
    ),
  ];

  static List<BoxShadow> buttonShadowActive = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 15,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> buttonShadowSmall = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 7,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> navShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 40,
      offset: const Offset(0, 5),
    ),
  ];

  static List<BoxShadow> imageShadowDefault = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 7,
      offset: const Offset(0, 7),
    ),
  ];

  static List<BoxShadow> imageShadowSmall = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> inputShadowSelectedDefault = [
    BoxShadow(
      color: AppColors.blue.withOpacity(0.15),
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> inputShadowSelectedError = [
    BoxShadow(
      color: AppColors.accentRed.withOpacity(0.25),
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> inputShadowSelectedSuccess = [
    BoxShadow(
      color: AppColors.green.withOpacity(0.15),
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];




}
