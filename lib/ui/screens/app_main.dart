import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:habitual/controllers/auth/auth_controller.dart';
import 'package:habitual/controllers/my_app/my_app_controller.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/screens/global_widgets/cart/cart_bottom_sheet.dart';
import 'package:habitual/ui/screens/profile/profile.dart';
import 'package:habitual/ui/screens/wishlist/wishlist.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'global_widgets/custom_icons/navbar_icons_icons.dart';
import 'home/home.dart';

class AppMain extends StatelessWidget with CartBottomSheet {
  AppMain({Key? key}) : super(key: key);

  final MyAppController myAppController = Get.find();
  final AuthController authController = Get.find();

  List<Widget> _buildScreens() {
    return [
      Home(),
      Wishlist(),
      Home(),
      Profile(),
      Wishlist(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          NavbarIcons.home,
          size: 20.r,
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          NavbarIcons.heart,
          size: 20.r,
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
      ),
      PersistentBottomNavBarItem(
        icon: CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(
            Assets.searchIcon,
            color: Colors.black,
            height: 16.r,
          ),
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          NavbarIcons.orders,
          size: 20.r,
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          NavbarIcons.cart,
          size: 20.r,
        ),
        activeColorPrimary: AppColors.uiGray_80,
        inactiveColorPrimary: AppColors.uiGray_40,
        onPressed: (context) {
          showCartBottomSheet(context!);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 80.h,
      controller: myAppController.persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration:
          const NavBarDecoration(colorBehindNavBar: Colors.white, boxShadow: [
        BoxShadow(
          color: AppColors.uiGray_20,
          blurRadius: 1,
          spreadRadius: 0,
          offset: Offset(0, 0),
        ),
      ]),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
      hideNavigationBar: false, // Choose the nav bar style with this property.
    );
  }
}
