import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/data/models/cart_model.dart';
import 'package:habitual/data/utils/static_data.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

import '../buttons/primary_button.dart';
import '../cards/cart/cart_product_card.dart';
import '../divider/app_divider_light.dart';

mixin CartBottomSheet on StatelessWidget {
  void showCartBottomSheet(BuildContext context) {
    if (!Navigator.canPop(context)) {
      showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return CartBottomSheetLayout();
        },
      );
    } else {
      Navigator.pop(context);
    }
  }
}

class CartBottomSheetLayout extends StatelessWidget {
  CartBottomSheetLayout({Key? key}) : super(key: key);

  final Map<String, CartModel> items = {
    StaticData.productAirpods.id: CartModel(StaticData.productAirpods, 1),
    StaticData.productVR.id: CartModel(StaticData.productVR, 1),
    StaticData.productLaptop.id: CartModel(StaticData.productLaptop, 1),
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.r),

                /// TITLE AND CLOSE ICON
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.close,
                          color: AppColors.uiGray_80,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Text(
                      "My cart",
                      style: AppTextStyles.h5
                          .copyWith(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const AppDividerLight(),
              Column(
                children: items.entries
                    .map((e) => CartProductCard(
                        product: e.value.product, quantity: e.value.quantity))
                    .toList(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24.r, 24.r, 24.r, 20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "TOTAL",
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.uiGray_60,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "\$${calculateTotalAmount().toStringAsFixed(2)}",
                          style: AppTextStyles.h4.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(
                      width: 40.h,
                    ),
                    Expanded(
                      child: PrimaryButton(
                          text: "Checkout",
                          iconRight: Icons.arrow_forward_ios_rounded,
                          onClick: () {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double calculateTotalAmount() {
    double total = 0;
    items.forEach((key, value) {
      total += value.product.sellingPrice * value.quantity;
    });
    return total;
  }
}
