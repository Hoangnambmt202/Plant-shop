import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/utils/pref_data.dart';
import 'package:plant_shoap_app/view/home/profile_screens/my_address_screen.dart';
import 'package:plant_shoap_app/view/home/profile_screens/my_orders.dart';
import 'package:plant_shoap_app/view/home/profile_screens/my_profile_screen.dart';
import 'package:plant_shoap_app/view/home/profile_screens/setting_screen.dart';

import 'my_cards/my_card_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenController profileScreenController =
      Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: regularWhite,
          body: SafeArea(
            child: GetBuilder<ProfileScreenController>(
              init: ProfileScreenController(),
              builder: (profileScreenController) => Column(
                children: [
                  Container(
                    color: regularWhite,
                    child: getAppBar("Profile",
                        iconpermmition: false
                        , space: 131.w),
                  ),
                  getVerSpace(20.h),
                  Container(
                    color: regularWhite,
                    width: double.infinity,
                    child: Column(
                      children: [
                        getVerSpace(30.h),
                        getAssetImage("profile.png",
                            height: 100.h, width: 100.w),
                        getVerSpace(20.h),
                        getCustomFont(
                            "Darlene Robertson", 18.sp, Color(0XFF000000), 1,
                            fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                        getVerSpace(8.h),
                        getCustomFont("darlenerobertson@gmail.com", 16.sp,
                            Color(0XFF808080), 1,
                            fontWeight: FontWeight.w500),
                        getVerSpace(20.h),
                        getProfileOption("myprofileIcon.svg", "My Profile",
                            () {
                          Get.to(MyProfile());
                        }),
                        getDivider(),
                        getProfileOption("myAddressIcon.svg", "My Address",
                            () {
                          Get.to(MyAddress());
                        }),
                        getDivider(),
                        GetBuilder<MyOrderScreenController>(
                          init: MyOrderScreenController(),
                          builder: (myOrderScreenController) =>
                              getProfileOption("myOrderIcon.svg", "My Orders",
                                  () {
                            myOrderScreenController
                                .onMyorderBackposition(true);
                            Get.to(MyOrders());
                          }),
                        ),
                        getDivider(),
                        getProfileOption("myCard.svg", "My Card", () {
                          Get.to(MyCard());
                        }),
                        getDivider(),
                        getProfileOption("settingIcon.svg", "Settings", () {
                          Get.to(Settings());
                        }),
                        getVerSpace(41.h),
                      ],
                    ),
                  ),
                  getVerSpace(20.h),
                  getCustomButton(
                    "Logout",
                    () {
                      Get.defaultDialog(
                          barrierDismissible: false,
                          title: '',
                          content: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Column(
                              children: [
                                getCustomFont(
                                    "Are you sure you want to Logout!",
                                    24.sp,
                                    Color(0XFF000000),
                                    2,
                                    fontWeight: FontWeight.w700,
                                    textAlign: TextAlign.center),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 25.h, bottom: 13.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: getCustomButton("Yes", () {
                                        PrefData.setIsSignIn(true);
                                        Get.back();
                                      }, buttonheight: 50.h)),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                          child: getCustomButton("No", () {
                                        Get.back();
                                      },
                                              color: Color(0XFF76974C),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFF76974C),
                                                  style: BorderStyle.solid,
                                                  width: 1.0.w,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.h),
                                              ),
                                              buttonheight: 50.h)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  ).paddingOnly(left: 20.h, right: 20.h)
                ],
              ),
            ),
          )),
    );
  }
}
