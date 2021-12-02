import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/add_to_cart_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/wishlist_icon_button.dart';
import 'package:habitual/ui/screens/global_widgets/pills/discount.dart';
import 'package:habitual/ui/screens/global_widgets/pills/staff_pick.dart';

import '../../rating.dart';

class HorizontalProductCardLarge extends StatelessWidget {
  const HorizontalProductCardLarge({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// PRODUCT IMAGE AND ICONS
        Stack(
          children: [
            ///IMAGE
            Container(
              height: 112.r,
              width: 112.r,
              child: Image.asset(Assets.productImage2),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: AppColors.uiGray_20,
                boxShadow: AppShadows.cardShadowMedium,
              ),
            ),

            /// WISHLIST ICON BUTTON
            Positioned(
              top: 8.r,
              right: 8.r,
              child: const WishlistIconButton(
                isSelected: false,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// NAME
              Text(
                product.productName,
                style: AppTextStyles.bodyRegular
                    .copyWith(color: AppColors.textGray_80),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 4.h,
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
                        style: AppTextStyles.h5
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
                            color: AppColors.textGray_40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),

                  /// DISCOUNT
                  if (product.discount != 0)
                    DiscountPill(discountPercentage: product.discount)
                ],
              ),
              SizedBox(
                height: 4.h,
              ),

              /// MISC
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// RATING, CATEGORY
                  Row(
                    children: [
                      const Rating(value: 4.5),
                      SizedBox(
                        width: 8.w,
                      ),
                      if (product.category.isNotEmpty)
                        Text(
                          product.category,
                          style: AppTextStyles.bodySmallBold,
                        ),
                    ],
                  ),

                  /// STAFF PICK PILL
                  if (product.isStaffPick) const StaffPickPill(),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),

              ///ADD TO CART BUTTON
              AddToCartButton(
                onClick: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
