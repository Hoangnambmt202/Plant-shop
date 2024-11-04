import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/main_project.dart';
import 'package:plant_shoap_app/view/login/loginScreen.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/utils/pref_data.dart';
import '../home/home_main_screen.dart';

class OnboardingStart extends StatefulWidget {
  const OnboardingStart({Key? key}) : super(key: key);

  @override
  State<OnboardingStart> createState() => _OnboardingStartState();
}

class _OnboardingStartState extends State<OnboardingStart> {
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Color(0XFFE8F0DE),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("${Constant.assetImagePath}onboarding4th.png"),
                fit: BoxFit.fill),
            color: Color(0XFFE8F0DE),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 21.w, right: 21.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(254.h),
                getCustomFont("Welcome to 👋", 34.sp, Color(0XFF000000), 1,
                    fontWeight: FontWeight.w700),
                getVerSpace(8.h),
                getCustomFont("Natura", 52.sp, Color(0XFF76974C), 1,
                    fontWeight: FontWeight.w700),
                getVerSpace(40.h),
                getCustomButton("Get started", () {
                  PrefData.setIsIntro(false);
                  // PrefData.setIsHome(false);
                  Get.to(LoginScreen());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
