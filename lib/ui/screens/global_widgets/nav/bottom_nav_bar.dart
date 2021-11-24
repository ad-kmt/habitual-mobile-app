import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitual/ui/constants/assets.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/screens/global_widgets/custom_icons/navbar_icons_icons.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.uiWhite,
        border: Border(
          top: BorderSide(width: 1.h, color: AppColors.uiGray_20),
        ),
      ),
      child: BottomNavigationBar(
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              NavbarIcons.home,
              color: AppColors.uiGray_80,
              size: 20.r,
            ),
            label: 'Home',
            backgroundColor: AppColors.bgWhite,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              NavbarIcons.heart,
              color: AppColors.uiGray_40,
              size: 20.r,
            ),
            label: 'Wishlist',
            backgroundColor: AppColors.bgWhite,
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primaryColor,
                child: SvgPicture.asset(Assets.searchIcon,color: Colors.black, height: 16.r,),),
            label: 'Search',
            backgroundColor: AppColors.bgWhite,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              NavbarIcons.orders,
              color: AppColors.uiGray_40,
              size: 20.r,
            ),
            label: 'Orders',
            backgroundColor: AppColors.bgWhite,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              NavbarIcons.cart,
              color: AppColors.uiGray_40,
              size: 20.r,
            ),
            label: 'Cart',
            backgroundColor: AppColors.bgWhite,
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (int x) {},
      ),
    );
  }
}
