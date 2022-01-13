import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/pills/discount_pill_primary.dart';
import 'package:habitual/ui/screens/global_widgets/pills/staff_pick.dart';

import '../../rating/rating_small.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// PRODUCT IMAGE AND ICONS
        Stack(
          children: [
            ///IMAGE
            Container(
              height: 112.r,
              width: 112.r,
              child: Image.asset(Assets.productImageLaptop),
              padding: EdgeInsets.all(18.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: AppColors.uiGray_20,
                boxShadow: AppShadows.cardShadowMedium,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Column(
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

              /// MISC
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// RATING, CATEGORY
                  Row(
                    children: [
                      const RatingSmall(value: 4.5),
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
    );
  }
}
