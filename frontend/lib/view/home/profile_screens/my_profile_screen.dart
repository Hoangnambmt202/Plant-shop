import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/view/home/profile_screens/edit_profile_screen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                  child: getAppBar("My Profile", function: () {
                    Get.back();
                  }, space: 131.w),
                ),
                getVerSpace(20.h),
                Expanded(
                  child: Container(
                    color: regularWhite,
                    width: double.infinity,
                    child: Column(
                      children: [
                        getVerSpace(30.h),
                        getAssetImage("profile.png", height: 100.h, width: 100.w),
                        getVerSpace(40.h),
                        getMyprofileDetailFormate(
                            "myprofileIcon.svg", "Name", "Darlene Robertson"),
                        getVerSpace(20.h),
                        getDivider(),
                        getVerSpace(20.h),
                        getMyprofileDetailFormate("mailIcon.svg", "Email",
                            "darlenerobertson@gmail.com"),
                        getVerSpace(20.h),
                        getDivider(),
                        getVerSpace(20.h),
                        getMyprofileDetailFormate(
                            "mobileIcon.svg", "Phone Number", "(219) 555-0114"),
                        getVerSpace(30.h),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 40.h),
                  child: getCustomButton("Edit Profile", () {
                    Get.to(EditProfileScreen());
                  }),
                )
                /*getVerSpace(30.h),
                    getAssetImage("userImage.png", height: 100.h, width: 100.w),
                    getVerSpace(40.h),
                    getMyprofileDetailFormate(
                        "profileIcon.png", "Name", "Darlene Robertson"),
                    getVerSpace(20.h),
                    getDivider(),
                    getVerSpace(20.h),
                    getMyprofileDetailFormate(
                        "mailIcon.png", "Email", "darlenerobertson@gmail.com"),
                    getVerSpace(20.h),
                    getDivider(),
                    getVerSpace(20.h),
                    getMyprofileDetailFormate(
                        "mobileIcon.png", "Phone Number", "(219) 555-0114"),
                    getVerSpace(20.h),
                    getDivider(),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 210.h),
                      child: getCustomButton("Edit Profile", () {
                        Get.to(EditProfileScreen());
                      }),
                    )*/
              ],
            ),
          ))),
    );
  }
}
