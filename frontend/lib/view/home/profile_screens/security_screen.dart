import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';

import '../../../utils/constantWidget.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return Scaffold(
        backgroundColor: regularWhite,
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              color: regularWhite,
              child: getAppBar("Security", space: 115.w, function: () {
                Get.back();
              }),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    color: regularWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        question('1.Types of data we collect'),
                        getVerSpace(16.h),
                        answer(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                      ],
                    ).paddingSymmetric(horizontal: 20.h, vertical: 20.h),
                  ).paddingSymmetric(vertical: 10.h),
                  Container(
                    color: regularWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        question('2. Use of your personal Data'),
                        getVerSpace(16.h),
                        answer(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                      ],
                    ).paddingSymmetric(horizontal: 20.h, vertical: 20.h),
                  ).paddingSymmetric(vertical: 10.h),
                  Container(
                    color: regularWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        question('3. Disclosure of your personal Data'),
                        getVerSpace(16.h),
                        answer(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                      ],
                    ).paddingSymmetric(horizontal: 20.h, vertical: 20.h),
                  ).paddingSymmetric(vertical: 10.h),
                ],
              ),
            )
          ]),
        ));
  }

  question(String s) {
    return Text(
      s,
      style: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.bold,
          color: Color(0XFF000000)),
    );
  }

  answer(String s) {
    return Text(
      s,
      style: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'Gilroy',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: Color(0XFF6E758A)),
    );
  }
}
