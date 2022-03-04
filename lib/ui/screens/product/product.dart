import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:habitual/controllers/product_screen_controller.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/tertiary_button_light.dart';
import 'package:habitual/ui/screens/global_widgets/page/page_dots_secondary.dart';
import 'package:habitual/ui/screens/global_widgets/pills/discount_pill_secondary.dart';
import 'package:habitual/ui/screens/global_widgets/rating/rating_long.dart';
import 'package:habitual/ui/screens/product/args/product_screen_args.dart';

class Product extends StatelessWidget {
  Product({Key? key}) : super(key: key);

  ProductScreenController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ProductScreenArguments args = Get.arguments as ProductScreenArguments;
    final ProductModel product = args.productModel;

    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      bottomNavigationBar: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(animation),
              child: child,
            );
          },
          child: productController.isProductInCart
              ? goToCartBottomNavigationBar(product)
              : priceBottomNavigationBar(product),
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
                      itemBuilder: (context, index) => product.image != null
                          ? Image.network(product.image!)
                          : Icon(
                              Icons.image,
                              color: AppColors.uiGray_40,
                              size: 50.r,
                            ),
                    ),
                    Positioned(
                      bottom: 24.h,
                      child: PageDotsSecondary(
                        controller: productController,
                        count: 3,
                      ),
                    )
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

  Widget goToCartBottomNavigationBar(ProductModel product) {
    return Container(
      key: const ValueKey<int>(1),
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        boxShadow: AppShadows.bottomNavShadow,
      ),
      height: 112.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TertiaryButtonLight(
              text: "Remove",
              onClick: () {
                productController.isProductInCart = false;
              }),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: PrimaryButton(
                text: "Go to cart",
                iconRight: Icons.arrow_forward_rounded,
                onClick: () {}),
          ),
        ],
      ),
    );
  }

  Widget priceBottomNavigationBar(ProductModel product) {
    return Container(
      key: const ValueKey<int>(0),
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
                    DiscountPillSecondary(discountPercentage: product.discount)
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
                productController.isProductInCart = true;
              },
            ),
          ),
        ],
      ),
    );
  }
}
