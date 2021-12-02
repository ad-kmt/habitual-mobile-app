import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/app_divider_light.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Container(
              height: 78.h,
              color: AppColors.uiGray_80,
              child: Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.remove_circle_outline_rounded,
                      color: AppColors.uiWhite,
                    ),
                    Text(
                      "$quantity",
                      style: AppTextStyles.h4.copyWith(
                          color: AppColors.uiWhite,
                          fontWeight: FontWeight.w700),
                    ),
                    const Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColors.uiWhite,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
              ),
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 78.h,
            child: Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),

                ///IMAGE
                Container(
                  height: 68.h,
                  width: 68.h,
                  child: Image.asset(Assets.productImage2),
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    color: AppColors.uiGray_20,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),

                ///PRODUCT DETAILS
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// NAME
                    SizedBox(
                      child: Text(
                        product.productName,
                        style: AppTextStyles.bodyRegular
                            .copyWith(color: AppColors.textGray_80),
                        overflow: TextOverflow.ellipsis,
                      ),
                      width: 112.w,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      child: Text(
                        "Hardcover",
                        style: AppTextStyles.h6.copyWith(
                            color: AppColors.textGray_80,
                            fontWeight: FontWeight.w800),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),

                ///QUANTITY
                SizedBox(
                  width: 27.w,
                  child: Text(
                    "x$quantity",
                    style: AppTextStyles.h6.copyWith(
                        color: AppColors.textGray_80,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),

                ///PRICE
                SizedBox(
                  width: 71.w,
                  child: Text(
                    "x${(quantity * product.sellingPrice).toStringAsFixed(2)}",
                    style: AppTextStyles.h6.copyWith(
                        color: AppColors.textGray_80,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
              ],
            ),
          ),
          const AppDividerLight(),
        ],
      ),
    );
  }
}
