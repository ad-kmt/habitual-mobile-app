import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitual/controllers/intro/intro_controller.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/screens/intro/widgets/intro_content.dart';

class Intro extends StatelessWidget {
  final IntroController introController = Get.find();

  final List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    print(value);
                    introController.currentPage = value;
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => IntroContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx buildDot({int? index}) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 135),
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: introController.currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: introController.currentPage == index
              ? AppColors.primaryColor
              : AppColors.uiGray_40,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }

  void printScreenInformation() {
    print('Device width dp:${1.sw}dp');
    print('Device height dp:${1.sh}dp');
  }
}
