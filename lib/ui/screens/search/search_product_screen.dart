import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/search_product_screen_controller.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/cards/search/search_result_card.dart';
import 'package:habitual/ui/screens/global_widgets/cards/search/search_suggestion_card.dart';
import 'package:habitual/ui/screens/global_widgets/divider/app_divider_light.dart';
import 'package:habitual/ui/screens/product/args/product_screen_args.dart';

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
              if (controller.isTyping) {
                return Transform.rotate(
                  angle: 45 * math.pi / 180,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: AppColors.uiGray_80,
                      size: 20.r,
                    ),
                    onPressed: () {
                      controller.searchFieldController.clear();
                      controller.searchFieldFocus.requestFocus();
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
          autofocus: true,
          focusNode: searchProductScreenController.searchFieldFocus,
          controller: searchProductScreenController.searchFieldController,
          cursorColor: AppColors.uiGray_100,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search by keyword or categories",
            hintStyle: TextStyle(
                color: AppColors.textGray_60, fontSize: 16, height: 16 / 16),
          ),
          onSubmitted: (text) {
            searchProductScreenController.onSubmitHandler();
          },
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
        child: SingleChildScrollView(
          child: GetBuilder<SearchProductScreenController>(
            builder: (controller) {
              if (!controller.isSubmitted) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.searchProductResults.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.suggestedSearchItemClickHandler(
                                controller.searchProductResults[index].name);
                          },
                          child: Column(
                            children: [
                              SearchSuggestionCard(
                                searchText: searchProductScreenController
                                    .searchFieldController.text,
                                boldText: getBoldText(
                                        searchProductScreenController
                                            .searchFieldController.text,
                                        controller.searchProductResults[index]
                                            .name) ??
                                    "",
                              ),
                              const AppDividerLight(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        )
                      ],
                    );
                  },
                );
              } else {
                if (controller.searchProductResults.isEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.searchNoResultSvg,
                            height: 102.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Oh no!",
                        style: AppTextStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "We couldn't find any results for!",
                        style: AppTextStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        "\"${controller.searchFieldController.text}\"",
                        style: AppTextStyles.bodyLarge
                            .copyWith(color: AppColors.textGray_60),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            Text(
                              "${controller.searchProductResults.length} Result(s) ",
                              style: AppTextStyles.bodyRegular
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "for \"${controller.searchFieldController.text}\"",
                              style: AppTextStyles.bodyRegular
                                  .copyWith(color: AppColors.textGray_60),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.searchProductResults.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.PRODUCT,
                                      arguments: ProductScreenArguments(
                                          controller
                                              .searchProductResults[index]),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      SearchResultCard(
                                        product: controller
                                            .searchProductResults[index],
                                      ),
                                      const AppDividerLight(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  String? getBoldText(String searchText, String productName) {
    if (productName.toLowerCase().startsWith(searchText.toLowerCase())) {
      return productName
          .toLowerCase()
          .replaceFirst(RegExp(searchText.toLowerCase()), "");
    }
  }
}
