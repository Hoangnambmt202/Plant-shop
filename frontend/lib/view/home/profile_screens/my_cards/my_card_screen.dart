import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/view/home/home_main_screen.dart';

import '../../../../model/payment_method_model.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  MyCardScreenController myCardScreenController =
      Get.put(MyCardScreenController());
  bool select = false;
  List<Payment> paymentOption = Data.getPaymentData();

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
              child: GetBuilder<MyCardScreenController>(
            init: MyCardScreenController(),
            builder: (myCardScreenController) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: regularWhite,
                  child: getAppBar("My Cards", function: () {
                    Get.back();
                  }, space: 130.w),
                ),
                getVerSpace(20.h),
                getCustomFont("Your cards", 16.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500)
                    .paddingSymmetric(horizontal: 20.h),
                getVerSpace(4.h),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: paymentOption.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          myCardScreenController.onSetCheakPosition(index);
                        },
                        child: Container(
                          color: regularWhite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  getAssetImage(paymentOption[index].image!,
                                      height: 34.h, width: 34.w),
                                  getHorSpace(20.w),
                                  paymentOption[index].type == 'card'
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            getCustomFont(
                                                paymentOption[index].name!,
                                                16,
                                                Color(0XFF000000),
                                                1,
                                                fontWeight: FontWeight.w700),
                                            getCustomFont("john@gmail.com",
                                                16.sp, subTitleColor, 1,
                                                fontWeight: FontWeight.w500,
                                                txtHeight: 1.5.h)
                                          ],
                                        )
                                      : getCustomFont(
                                          paymentOption[index].name!,
                                          16,
                                          Color(0XFF000000),
                                          1,
                                          fontWeight: FontWeight.w700),
                                ],
                              ),
                              myCardScreenController.cheakPosition == index
                                  ? getSvgImage("radio_fill.svg",
                                      height: 24.h, width: 24.h)
                                  : getSvgImage("radio_button.svg",
                                      height: 24.h, width: 24.h)
                            ],
                          ).paddingSymmetric(vertical: 20.h, horizontal: 20.h),
                        ).paddingSymmetric(vertical: 10.h),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 56.h, top: 30.h, left: 20.w, right: 20.w),
                  child: myCardScreenController.cheakPosition != null
                      ? getCustomButton("Save", () {
                          Get.back(result: HomeMainScreen());
                        })
                      : getCustomButton("Save", () {},
                          decoration: BoxDecoration(
                              color: buttonColor.withOpacity(0.14),
                              borderRadius: BorderRadius.circular(16.h))),
                )
              ],
            ),
          ))),
    );
  }
}
