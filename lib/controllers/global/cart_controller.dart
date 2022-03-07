import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/global/user_controller.dart';
import 'package:habitual/data/models/cart_item_model.dart';
import 'package:habitual/data/models/product_model.dart';
import 'package:habitual/data/models/user_model.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  UserController userController = Get.find();

  final _cartTotalAmount = 0.0.obs;

  get totalCartAmount => _cartTotalAmount.value;

  set totalCartAmount(val) => _cartTotalAmount.value = val;

  @override
  void onInit() {
    ever(userController.userRx, changeCartTotalPrice);
    super.onInit();
  }

  bool addProductToCart(ProductModel product) {
    try {
      bool? isItemInCart = isItemAlreadyAdded(product);
      if (isItemInCart == null) {
        Get.snackbar("Error", "User not logged in");
        return false;
      } else if (isItemInCart) {
        Get.snackbar("Check your cart", "${product.name} is already added");
        return false;
      } else {
        String cartItemId = const Uuid().v1();
        UserModel? user = userController.user;
        print(user?.toJson());
        if (user != null) {
          CartItemModel cartItemModel =
              CartItemModel.fromProductModel(cartItemId, product, 1);
          user.cart.add(cartItemModel);
          userController.updateUserData(user);
          print(user.toJson());
          Get.snackbar("Item added", "${product.name} was added to your cart");
          changeCartTotalPrice(user);
          return true;
        } else {
          log("Cannot add item to cart, User not logged in");
          return false;
        }
      }
    } catch (e, s) {
      Get.snackbar("Error", "Cannot add this item");
      log(e.toString());
      log(s.toString());
      return false;
    }
  }

  bool removeProductFromCart(ProductModel product) {
    try {
      UserModel? user = userController.user;
      if (user != null) {
        user.cart.removeWhere((element) => element.productId == product.id);
        userController.updateUserData(user);
        changeCartTotalPrice(user);
        Get.snackbar(
            "Item removed", "${product.name} was removed from your cart");
        return true;
      } else {
        log("Cannot remove item from cart, User not logged in");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.toString());
      return false;
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      UserModel? user = userController.user;
      if (user != null) {
        user.cart.removeWhere((element) => element.id == cartItem.id);
        userController.updateUserData(user);
        changeCartTotalPrice(user);
      } else {
        log("Cannot remove item, User not logged in");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
      debugPrint(e.toString());
    }
  }

  bool? isItemAlreadyAdded(ProductModel product) => userController.user?.cart
      .where((item) => item.productId == product.id)
      .isNotEmpty;

  changeCartTotalPrice(UserModel? userModel) {
    totalCartAmount = 0.0;
    if (userModel != null && userModel.cart.isNotEmpty) {
      for (var cartItem in userModel.cart) {
        totalCartAmount += cartItem.sellingPrice * cartItem.quantity;
      }
    }
  }

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      UserModel? user = userController.user;
      if (user != null) {
        user.cart.map(
          (e) {
            if (e.id == item.id) {
              e.quantity--;
            }
            return e;
          },
        ).toList();
        userController.updateUserData(user);
        log("Decreasing item");
      } else {
        log("Cannot decrease item quantity, User not logged in");
      }
    }
  }

  void increaseQuantity(CartItemModel item) {
    UserModel? user = userController.user;
    if (user != null) {
      user.cart.map(
        (e) {
          if (e.id == item.id) {
            e.quantity++;
          }
          return e;
        },
      ).toList();
      log("Increasing item");
      userController.updateUserData(user);
    } else {
      log("Cannot increase item quantity, User not logged in");
    }
  }
}
