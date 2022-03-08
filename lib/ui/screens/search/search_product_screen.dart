import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/search_product_screen_controller.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';

class SearchProductScreen extends StatelessWidget {
  SearchProductScreen({Key? key}) : super(key: key);

  final SearchProductScreenController searchProductScreenController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgWhite,
        elevation: 0.0,
        shape: const Border(
            bottom: BorderSide(color: AppColors.uiGray_20, width: 1)),
        leading: Padding(
          padding: EdgeInsets.all(20.r),
          child: SvgPicture.asset(
            Assets.searchIcon,
            color: Colors.black,
          ),
        ),
        actions: [
          GetBuilder<SearchProductScreenController>(
            builder: (controller) {
              if (searchProductScreenController.isTyping) {
                return Transform.rotate(
                  angle: 45 * math.pi / 180,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: AppColors.uiGray_80,
                      size: 20.r,
                    ),
                    onPressed: () {
                      searchProductScreenController.searchFieldController
                          .clear();
                    },
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
        titleSpacing: 0,
        title: TextField(
          controller: searchProductScreenController.searchFieldController,
          cursorColor: AppColors.uiGray_100,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search by keyword or categories",
            hintStyle: TextStyle(
                color: AppColors.textGray_60, fontSize: 16, height: 16 / 16),
          ),
        ),
      ),
      body: GestureDetector(
        //To change focus from search bar to screen.
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
