import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/product/product_controller.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/page/page_dots_secondary.dart';
import 'package:habitual/ui/screens/global_widgets/pills/discount_pill_secondary.dart';
import 'package:habitual/ui/screens/global_widgets/rating/rating_long.dart';

class Product extends StatelessWidget {
  Product({Key? key, required this.product}) : super(key: key);

  ProductController productController = Get.find();

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 32.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          boxShadow: AppShadows.bottomNavShadow,
        ),
        height: 112.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "WITH YOUR OPTIONS",
                  style: AppTextStyles.hint,
                ),
                SizedBox(
                  height: 8.h,
                ),

                /// PRICE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// SELLING PRICE
                        Text(
                          "\$${product.sellingPrice.toStringAsFixed(2)}",
                          style: AppTextStyles.h4
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),

                        /// ACTUAL PRICE
                        if (product.discount != 0)
                          Text(
                            "\$${product.actualPrice.toStringAsFixed(2)}",
                            style: AppTextStyles.strikeSmall.copyWith(
                              color: AppColors.textGray_80.withOpacity(0.75),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),

                    /// DISCOUNT
                    if (product.discount != 0)
                      DiscountPillSecondary(
                          discountPercentage: product.discount)
                  ],
                ),
              ],
            ),
            CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.bgWhite,
              child: IconButton(
                color: AppColors.uiGray_80,
                padding: const EdgeInsets.all(0),
                iconSize: 24.r,
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.uiGray_80,
                ),
                onPressed: () {
                  // do something
                },
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Container(
                height: 320.h,
                color: AppColors.uiGray_20,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 64.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.arrow_back,
                                color: AppColors.uiGray_80,
                              ),
                              Icon(
                                Icons.favorite_border_rounded,
                                color: AppColors.uiGray_80,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    PageView.builder(
                      onPageChanged: (value) {
                        productController.currentPage = value;
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) =>
                          Image.asset(Assets.productImage1),
                    ),
                    Positioned(
                        bottom: 24.h,
                        child: PageDotsSecondary(
                          controller: productController,
                          count: 3,
                        ))
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 20.h,
                    color: AppColors.uiGray_20,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r),
                      ),
                      color: AppColors.bgWhite,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: AppTextStyles.h4
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          RatingLong(value: product.rating ?? 0),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(
                            "DESCRIPTION",
                            style: AppTextStyles.label.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.textGray_80),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            product.description,
                            style: AppTextStyles.bodyRegular.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGray_80),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
