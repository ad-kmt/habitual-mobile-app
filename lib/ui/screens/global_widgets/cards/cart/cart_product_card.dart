import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/global/cart_controller.dart';
import 'package:habitual/controllers/global/product_controller.dart';
import 'package:habitual/data/models/cart_item_model.dart';
import 'package:habitual/routes/app_pages.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/divider/app_divider_light.dart';
import 'package:habitual/ui/screens/product/args/product_screen_args.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard({Key? key, required this.cartItemModel}) : super(key: key);

  final CartItemModel cartItemModel;

  final CartController cartController = Get.find();
  final ProductDataController productDataController = Get.find();

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
                    IconButton(
                      padding: const EdgeInsets.all(4),
                      onPressed: () {
                        cartController.decreaseQuantity(cartItemModel);
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline_rounded,
                        color: AppColors.uiWhite,
                      ),
                    ),
                    Text(
                      "${cartItemModel.quantity}",
                      style: AppTextStyles.h4.copyWith(
                          color: AppColors.uiWhite,
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(4),
                      onPressed: () {
                        cartController.increaseQuantity(cartItemModel);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: AppColors.uiWhite,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.PRODUCT,
                      arguments: ProductScreenArguments(productDataController
                          .getProductModel(cartItemModel.productId)),
                    );
                  },
                  child: Container(
                    height: 68.h,
                    width: 68.h,
                    child: cartItemModel.image != null
                        ? Image.network(cartItemModel.image!)
                        : Icon(
                            Icons.image,
                            color: AppColors.uiGray_40,
                            size: 40.r,
                          ),
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      color: AppColors.uiGray_20,
                    ),
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
                        cartItemModel.name,
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
                  width: 12.w,
                ),

                ///QUANTITY
                SizedBox(
                  width: 27.w,
                  child: Text(
                    "x${cartItemModel.quantity}",
                    style: AppTextStyles.h6.copyWith(
                        color: AppColors.textGray_80,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),

                ///PRICE
                SizedBox(
                  width: 80.w,
                  child: Text(
                    "\$${(cartItemModel.quantity * cartItemModel.sellingPrice).toStringAsFixed(2)}",
                    style: AppTextStyles.h5.copyWith(
                        color: AppColors.textGray_80,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                const Expanded(
                  child: Icon(
                    Icons.arrow_left_rounded,
                    color: AppColors.uiGray_80,
                    size: 18,
                  ),
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
