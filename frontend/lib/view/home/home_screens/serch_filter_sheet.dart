import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/model/filterSheet_data_model.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';

import '../../../datafile/model_data.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  FilterSheetController filterSheetController =
      Get.put(FilterSheetController());
  bool activevalue = false;
  List<FilterData> filter = Data.getFilterData();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<FilterSheetController>(
      init: FilterSheetController(),
      builder: (filterSheetController) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getVerSpace(20.h),
          getCustomFont("Sort By", 20.sp, regularBlack, 1,
              fontWeight: FontWeight.w700),
          getVerSpace(30.h),
          Flexible(
            child: ListView.builder(
              // primary: true,
              shrinkWrap: true,
              itemCount: filter.length,
              itemBuilder: (context, index) => Column(
                children: [
                  getCustomContainer(41.h, double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomFont(
                              filter[index].cetegory!, 16.sp, regularBlack, 1,
                              fontWeight: FontWeight.w500),
                          Radio(
                            activeColor: buttonColor,
                            value: index,
                            groupValue: filterSheetController.option,
                            onChanged: (Object? value) {
                              filterSheetController.onChageOptionValue(index);
                              // setState(() {
                              //   option = index;
                              // });
                            },
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20.h)),
                  index == filter.length - 1
                      ? SizedBox()
                      : getDivider(color: Color(0XFFF1F1F1))
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: getCustomButton(
                "Reset",
                () {
                  Get.back();
                },
                color: buttonColor,
                decoration: BoxDecoration(
                    border: Border.all(color: buttonColor),
                    borderRadius: BorderRadius.circular(16.h)),
                buttonheight: 60.h,
              ) /*getCustomButton( "Yes",
                      regularWhite, () {
                        PrefData.setIsSignIn(true);
                        Get.off(LoginScreen());
                      }, 18.sp,
                      borderRadius: BorderRadius.circular(16.h),
                      buttonHeight: 56.h)*/
                  ),
              getHorSpace(10.w),
              Expanded(
                  child: getCustomButton("Apply", () {
                Get.back();
              }, buttonheight: 60.h)),
            ],
          ).paddingOnly(left: 20.h, right: 20.h, bottom: 45.h, top: 40.h)
        ],
      ),
    );
  }
}
