import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:habitual/data/utils/static_data.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/primary_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/secondary_button.dart';
import 'package:habitual/ui/screens/global_widgets/cards/product/vertical_product_card_large.dart';
import 'package:habitual/ui/screens/global_widgets/cards/wishlist/wishlist_card_small.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                /// Background Rectangle
                Container(
                  height: 314.h,
                  decoration:
                      const BoxDecoration(color: AppColors.primaryColor),
                ),

                /// WISHLIST LAYOUT
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.r),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 64.h,
                          ),

                          ///TITLE AND AVATAR
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ///TITLE
                              SizedBox(
                                width: 279.w,
                                child: Text(
                                  "Wishlist",
                                  style: AppTextStyles.h3.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textGray_80),
                                ),
                              ),

                              ///AVATAR
                              const CircleAvatar(
                                  backgroundColor: AppColors.bgWhite,
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors.uiGray_80,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.bgWhite,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: AppShadows.cardShadowLarge,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  SvgPicture.asset(
                                    Assets.wishlistEmpty,
                                    height: 64.h,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Text(
                                    "You have no saved products",
                                    style: AppTextStyles.h4.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.textGray_80,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "You have no saved products. Start saving to add to wishlists or create one.",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.bodyRegular.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textGray_60,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  PrimaryButton(
                                    text: "Create a wishlist",
                                    onClick: () {},
                                    iconLeft: Icons.add,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.bgWhite,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: AppShadows.cardShadowLarge,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Wishlist Name 1",
                                        style: AppTextStyles.h4.copyWith(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Icon(
                                        Icons.more_horiz_rounded,
                                        color: AppColors.uiGray_40,
                                        size: 24.r,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  WishlistCardSmall(
                                      product: StaticData.productModel),
                                  SizedBox(
                                    height: 16.w,
                                  ),
                                  WishlistCardSmall(
                                      product: StaticData.productModel),
                                  SizedBox(
                                    height: 16.w,
                                  ),
                                  WishlistCardSmall(
                                      product: StaticData.productModel),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.bgWhite,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: AppShadows.cardShadowLarge,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Wishlist Name 2",
                                        style: AppTextStyles.h4.copyWith(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Icon(
                                        Icons.more_horiz_rounded,
                                        color: AppColors.uiGray_40,
                                        size: 24.r,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  WishlistCardSmall(
                                      product: StaticData.productModel),
                                  SizedBox(
                                    height: 16.w,
                                  ),
                                  WishlistCardSmall(
                                      product: StaticData.productModel),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),

                          ///BUTTON CREATE WISHLIST
                          SecondaryButton(
                            text: "Create a new wishlist",
                            onClick: () {},
                            iconLeft: Icons.add,
                          ),
                          SizedBox(
                            height: 42.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SUGGESTED FOR YOU",
                                style: AppTextStyles.label.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.uiGray_80),
                              ),
                              Text(
                                "SEE ALL",
                                style: AppTextStyles.linkSmall.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.uiGray_60),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 312.h,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          double paddingLeft = (index == 0) ? 16.w : 0;
                          double paddingRight = (index == 4) ? 16.w : 0;
                          return Container(
                            padding: EdgeInsets.fromLTRB(
                                paddingLeft + 8, 0, paddingRight + 8, 0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: VerticalProductCardLarge(
                                product: StaticData.productModel,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
