import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/view/home/profile_screens/help_center_screen.dart';
import 'package:plant_shoap_app/view/home/profile_screens/notification%20_scrern.dart';
import 'package:plant_shoap_app/view/home/profile_screens/privacy_policy.dart';
import 'package:plant_shoap_app/view/home/profile_screens/security_screen.dart';
import 'package:plant_shoap_app/view/home/profile_screens/terms_and_condition.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingScreenController settingScreenController =
      Get.put(SettingScreenController());

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

              child: GetBuilder<SettingScreenController>(
                init: SettingScreenController(),
                builder: (settingScreenController) => Column(
                  children: [
                    Container(
                      color: regularWhite,
                      child: getAppBar("Settings", function: () {
                        Get.back();
                      }, space: 115.w),
                    ),
                    getVerSpace(20.h),
                    Expanded(
                        child: ListView(
                      children: [
                        Container(
                          color: regularWhite,
                          child: Column(
                            children: [
                              getVerSpace(20.h),
                              getProfileOption(
                                  "notification_icon.svg", "Notification", () {
                                    Get.to(NotificationScreen());
                              },
                                  height: 24.h, width: 24.h),
                              getDivider(),
                              getProfileOption(
                                  "help_center_icon.svg", "Help Center", () {
                                    Get.to(HelpCenterScreen());
                              },
                                  height: 24.h, width: 24.h),
                              getDivider(),
                              getProfileOption(
                                  "privacy_policy_icon.svg", "Privacy Policy", () {
                                Get.to(PrivacyPolicy());
                              }, height: 24.h, width: 24.h),
                              getDivider(),
                              getProfileOption("security_icon.svg", "Security", () {
                                Get.to(SecurityScreen());
                              },
                                  height: 24.h, width: 24.h),
                              getDivider(),
                              //Get.to(TermCondition());
                              getProfileOption(
                                  "setting_screen_setting_icon.svg", "Terms And Conditions",
                                      () {
                                    Get.to(TermCondition());
                                  }, height: 24.h, width: 24.h),
                              getVerSpace(20.h),
                             // getDivider(),
                              //getVerSpace(20.h),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ))),
    );
  }
}
