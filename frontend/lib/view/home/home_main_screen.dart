import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/main_project.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';

import 'package:plant_shoap_app/view/home/home_screens/home_screen.dart';


import 'profile_screens/profile_screen.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }

  HomeMainScreenController homeMainScreenController =
      Get.put(HomeMainScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
        onWillPop: () async {
          closeApp();
          return false;
        },
        child: Scaffold(
          backgroundColor: regularWhite,
          body: GetBuilder<HomeMainScreenController>(
                      init: HomeMainScreenController(),
                      builder: (homeMainScreenController) => Scaffold(
          body: _body(),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(22.h),
                    topLeft: Radius.circular(22.h)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0XFF23408F).withOpacity(0.12),
                      spreadRadius: 0,
                      blurRadius: 12),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0.h),
                  topRight: Radius.circular(22.0.h),
                ),
                child: BottomNavigationBar(
                    backgroundColor: const Color(0XFFFFFFFF),
                    currentIndex: homeMainScreenController.position.value,
                    onTap: (index) {
                      // setState(() {
                      //   currentvalue = index;
                      // });
                      homeMainScreenController.onChange(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}line.png"),
                                  height: 1.75.h,
                                  width: 24.w),
                              getVerSpace(8.79.h),
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}homefillIcon.png"),
                                  height: 24.h,
                                  width: 24.w),
                            ],
                          ),
                          icon: Image(
                            image: AssetImage(
                                "${Constant.assetImagePath}homeIcon.png"),
                            height: 24.h,
                            width: 24.w,
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}line.png"),
                                  height: 1.75.h,
                                  width: 24.w),
                              getVerSpace(8.79.h),
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}likefillIcon.png"),
                                  height: 24.h,
                                  width: 24.w),
                            ],
                          ),
                          icon: Image(
                              image: AssetImage(
                                  "${Constant.assetImagePath}likeIcon.png"),
                              height: 24.h,
                              width: 24.w),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}line.png"),
                                  height: 1.75.h,
                                  width: 24.w),
                              getVerSpace(8.79.h),
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}cartfillIcon.png"),
                                  height: 24.h,
                                  width: 24.w),
                            ],
                          ),
                          icon: Image(
                              image: AssetImage(
                                  "${Constant.assetImagePath}cartbagIcon.png"),
                              height: 24.h,
                              width: 24.w),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}line.png"),
                                  height: 1.75.h,
                                  width: 24.w),
                              getVerSpace(8.79.h),
                              Image(
                                  image: AssetImage(
                                      "${Constant.assetImagePath}profilefillIcon.png"),
                                  height: 24.h,
                                  width: 24.w),
                            ],
                          ),
                          icon: Image(
                              image: AssetImage(
                                  "${Constant.assetImagePath}profileIcon.png"),
                              height: 24.h,
                              width: 24.w),
                          label: ''),
                    ]),
              )),
                      ),
                    ),
        ));
  }

  _body() {
    switch (homeMainScreenController.position.value) {
      case 0:
        return MainProject();
      case 1:
        return const MainProject();
      //FavouriteItemScreen();

      case 2:
        return MainProject();
      //NoCartItemScreen();
      case 3:
        return ProfileScreen();
      default:
        return const Center(
          child: Text("inavalid"),
        );
    }
  }
}
