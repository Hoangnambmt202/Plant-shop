import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/main_project.dart';
import 'package:plant_shoap_app/model/onboarding_slider.dart';
import 'package:plant_shoap_app/view/login/loginScreen.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/view/home/home_main_screen.dart';
import 'package:plant_shoap_app/view/onboarding/onbording_started_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingScreenController onboardingScreenController =
      Get.put(OnboardingScreenController());
  PageController controller = PageController();
  List<Sliders> pages = Data.getSliderPages();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
            child: GetBuilder(
          init: OnboardingScreenController(),
          builder: (onboardingScreenController) => Stack(
            children: [
              generatepage(),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 42.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 645.h),
                child: indicator(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  skipButton(),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 708.h),
                  child: getCustomButton("Next", () {
                    if (onboardingScreenController.currentPage ==
                        pages.length - 1) {
                      Get.to(OnboardingStart());
                    } else {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn);
                    }
                  })),
            ],
          ),
        )),
      ),
    );
  }

  Widget generatepage() {
    return PageView.builder(
        itemCount: pages.length,
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (value) {
          onboardingScreenController.onPageChange(value);
        },
        itemBuilder: (context, index) {
          print(controller.initialPage);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getVerSpace(61.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 134.w),
                child: RichText(
                  text: TextSpan(
                    text: pages[index].richTitle1st,
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gilroy',
                      fontSize: 34.sp,
                    ),
                    children: [
                      TextSpan(
                        text: pages[index].richTitle2nd,
                        style: TextStyle(
                            color: Color(0XFF76974C),
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Gilroy'),
                      ),
                      TextSpan(
                        text: pages[index].richTitle3rd,
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          fontSize: 34.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              getVerSpace(35.h),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "${Constant.assetImagePath}${pages[index].image}"),
                        fit: BoxFit.fill)),
              ))
            ],
          );
        });
  }

  Widget indicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pages.length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 7.h,
            width: index == onboardingScreenController.currentPage ? 16.w : 7.w,
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 30.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.h),
                color: (index == onboardingScreenController.currentPage)
                    ? const Color(0XFF76974C)
                    : const Color(0XFF76974C).withOpacity(0.3)),
          );
        }));
  }

  Widget skipButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 20),
      child: GestureDetector(
          onTap: () {
            onboardingScreenController.currentPage == 2
                ? Get.to(MainProject())
                : setState(() {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  });
          },
          child: getCustomFont("Skip", 14.sp, Color(0XFF000000), 1,
              fontWeight: FontWeight.w500)),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
