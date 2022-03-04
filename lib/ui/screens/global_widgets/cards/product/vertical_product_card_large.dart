import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/wishlist_icon_button.dart';
import 'package:habitual/ui/screens/global_widgets/pills/discount_pill_primary.dart';
import 'package:habitual/ui/screens/global_widgets/pills/staff_pick.dart';
import 'package:habitual/ui/screens/global_widgets/rating/rating_small.dart';

class VerticalProductCardLarge extends StatelessWidget {
  const VerticalProductCardLarge({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285.w,
      height: 312.h,
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
                width: double.infinity,
                child: product.image != null
                    ? Image.network(product.image!)
                    : Icon(
                        Icons.image,
                        color: AppColors.uiGray_40,
                        size: 50.r,
                      ),
                height: 160.h,
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
                  product.name,
                  style:
                      AppTextStyles.h4.copyWith(color: AppColors.textGray_80),
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
                      DiscountPillPrimary(discountPercentage: product.discount)
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),

                /// DESCRIPTION
                if (product.description.isNotEmpty)
                  Text(
                    product.description,
                    maxLines: 2,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.uiGray_60,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                SizedBox(
                  height: 12.h,
                ),

                /// MISC
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// RATING, CATEGORY
                    Row(
                      children: [
                        const RatingSmall(value: 4.5),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text(
                          '(${33})',
                          style: AppTextStyles.bodySmall,
                        ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
