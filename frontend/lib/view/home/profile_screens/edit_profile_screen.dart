import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/view/home/home_main_screen.dart';

import '../../../utils/constantWidget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          resizeToAvoidBottomInset: false,
          backgroundColor: regularWhite,
          body: GetBuilder<ProfileScreenController>(
            init: ProfileScreenController(),
            builder: (profileScreenController) => Center(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            getVerSpace(4.h),
                            getAppBar("Edit Profile", function: () {
                              Get.back();
                            }, space: 131.w),
                            getVerSpace(30.h),
                            Stack(children: [
                              getAssetImage("profile.png",
                                  height: 100.h, width: 100.w),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 82.h, left: 35.w),
                                child: getAssetImage("editProfileIcon.png",
                                    height: 30.h, width: 30.w),
                              ),
                            ]),
                            getVerSpace(40.h),
                            getEditProfileOptionFormate(false,
                                iconImage: "profileIcon.png",
                                userdetail: "Darlene Robertson",
                                requredImage: true),
                            getVerSpace(20.h),
                            getEditProfileOptionFormate(false,
                                iconImage: "mailIcon.png",
                                userdetail: "darlenerobertson@gmail.com",
                                requredImage: true),
                            getVerSpace(20.h),
                            getEditProfileOptionFormate(false,
                                iconImage: "mobileIcon.png",
                                userdetail: "(219) 555-0114",
                                requredImage: true),
                          ],
                        )
                      ],
                    ),
                  )),
                  getVerSpace(20.h),
                  getCustomButton("Save", () {
                    Get.off(HomeMainScreen());
                  }).paddingOnly(bottom: 40.h, left: 20.h, right: 20.h)
                ],
              ),
            ),
          )),
    );
  }
}
