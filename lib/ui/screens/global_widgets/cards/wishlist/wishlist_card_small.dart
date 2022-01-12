import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/add_to_cart_button.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/wishlist_icon_button.dart';
import 'package:habitual/ui/screens/global_widgets/pills/discount_pill_primary.dart';

class WishlistCardSmall extends StatelessWidget {
  const WishlistCardSmall({Key? key, required this.product}) : super(key: key);

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
              height: 88.r,
              width: 88.r,
              child: Image.asset(Assets.productImage2),
              padding: EdgeInsets.all(8.r),
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
                isSelected: true,
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
                product.name,
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
                        style: AppTextStyles.h6
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
                    ],
                  ),

                  /// DISCOUNT
                  if (product.discount != 0)
                    DiscountPillPrimary(discountPercentage: product.discount)
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
