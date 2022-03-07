import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/global/cart_controller.dart';
import 'package:habitual/controllers/global/user_controller.dart';
import 'package:habitual/data/models/user_model.dart';
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

  CartController cartController = Get.find();
  UserController userController = Get.find();

  // final Map<String, CartItemModel> items = {
  //   StaticData.productAirpods.id:
  //       CartItemModel("1", StaticData.productAirpods, 1),
  //   StaticData.productVR.id: CartItemModel("2", StaticData.productVR, 1),
  //   StaticData.productLaptop.id:
  //       CartItemModel("3", StaticData.productLaptop, 1),
  // };

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
              Obx(() {
                UserModel? user = userController.user;
                if (user == null) {
                  return const Text("Please login");
                } else if (user.cart.isEmpty) {
                  return const Text("Cart is Empty");
                } else {
                  return Column(
                    children: user.cart
                        .map((e) => CartProductCard(cartItemModel: e))
                        .toList(),
                  );
                }
              }),
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
                        Obx(
                          () => Text(
                            "\$${cartController.totalCartAmount.toStringAsFixed(2)}",
                            style: AppTextStyles.h4.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
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
}
