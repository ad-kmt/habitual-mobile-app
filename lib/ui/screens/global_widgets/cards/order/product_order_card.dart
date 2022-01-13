import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/shadows.dart';
import 'package:habitual/ui/constants/text_styles.dart';
import 'package:habitual/ui/screens/global_widgets/buttons/icon_buttons/wishlist_icon_button.dart';

class OrderedProductCard extends StatelessWidget {
  const OrderedProductCard(
      {Key? key, required this.product, required this.status})
      : super(key: key);

  final ProductModel product;
  final int status;

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
              height: 88.r,
              width: 88.r,
              child: Image.asset(Assets.productImageLaptop),
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
                        style: AppTextStyles.h6.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.uiGray_80),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),

              /// ORDER STATUS
              if (status == 1)
                inTransitStatus()
              else if (status == 2)
                deliveredStatus()
              else if (status == 0)
                cancelledStatus(),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget inTransitStatus() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Almost there!",
          style:
              AppTextStyles.linkRegular.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(
          width: 8.w,
        ),
        Icon(
          Icons.bolt,
          size: 16.r,
          color: AppColors.primaryColor,
        )
      ],
    );
  }

  Widget cancelledStatus() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Cancelled",
          style:
              AppTextStyles.linkRegular.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(
          width: 8.w,
        ),
        Icon(
          Icons.close,
          size: 16.r,
          color: AppColors.accentRed,
        )
      ],
    );
  }

  Widget deliveredStatus() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Delivered",
          style: AppTextStyles.linkRegular
              .copyWith(fontWeight: FontWeight.w800, color: AppColors.green),
        ),
        SizedBox(
          width: 8.w,
        ),
        Icon(
          Icons.check_circle,
          size: 16.r,
          color: AppColors.green,
        )
      ],
    );
  }
}
