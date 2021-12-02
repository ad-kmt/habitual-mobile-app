import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/wishlist_icon_button.dart';
import 'package:habitual/ui/screens/global_widgets/pills/staff_pick.dart';

import '../../rating.dart';

class VerticalProductCardSmall extends StatelessWidget {
  const VerticalProductCardSmall({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 241.h,
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: AppShadows.cardShadowMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///PRODUCT IMAGE
          Stack(
            children: [
              /// IMAGE
              Container(
                child: const Image(
                  image: AssetImage(Assets.productImage2),
                ),
                height: 136.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  color: AppColors.uiGray_20,
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

          /// PRODUCT DETAILS
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
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
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),

                /// MISC
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// RATING, CATEGORY
                    const Rating(value: 4.5),

                    /// STAFF PICK PILL
                    if (product.isStaffPick) const StaffPickPill(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
