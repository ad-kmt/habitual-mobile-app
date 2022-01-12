import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitual/ui/constants/colors.dart';

class PageDotsSecondary extends StatelessWidget {
  const PageDotsSecondary(
      {Key? key, required this.count, required this.controller})
      : super(key: key);

  final int count;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => buildDot(index: index),
      ),
    );
  }

  Widget buildDot({int? index}) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 135),
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: controller.currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: controller.currentPage == index
              ? AppColors.uiGray_100.withOpacity(0.5)
              : AppColors.uiGray_40.withOpacity(0.5),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
