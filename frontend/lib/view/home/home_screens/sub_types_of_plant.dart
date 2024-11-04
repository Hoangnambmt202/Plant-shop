import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/controller.dart';
import '../../../datafile/model_data.dart';
import '../../../model/plant_sub_types_model.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constantWidget.dart';

class SubTypesOfPlant extends StatefulWidget {
  const SubTypesOfPlant({Key? key}) : super(key: key);

  @override
  State<SubTypesOfPlant> createState() => _SubTypesOfPlantState();
}

class _SubTypesOfPlantState extends State<SubTypesOfPlant> {
  SubtypesOfPlantScreenController subtypesOfPlantScreenController =
      Get.put(SubtypesOfPlantScreenController());
  List<PlantSubtype> subType = Data.getPlantSubtype();

  Future<bool> _future = Future<bool>.delayed(
    Duration(milliseconds: 400),
    () {
      return true;
    },
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
            body: SafeArea(
              child: GetBuilder<SubtypesOfPlantScreenController>(
          init: SubtypesOfPlantScreenController(),
          builder: (subtypesOfPlantScreenController) => Column(
              children: [
                Container(
                    height: 73.h,
                    width: double.infinity,
                    color: regularWhite,
                    child:
                        getAppBar("European Olive", space: 85.h, function: () {
                      Get.back();
                    })),
                getVerSpace(20.h),
                Expanded(
                    child: Container(
                  color: regularWhite,
                  child: FutureBuilder<bool>(
                    future: _future,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.hasData) {
                        return subTypesList();
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.14),
                          highlightColor: bgColor,
                          direction: ShimmerDirection.ltr,
                          child: subTypesList(),
                        );
                      }
                    },
                  ),
                ))
              ],
          ),
        ),
            )));
  }

  Widget subTypesList() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240.h,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 10.h),
      itemCount: subType.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.h), color: regularWhite),
            child: Column(
              children: [
                Stack(
                  children: [
                    getCustomContainer(
                      180.h,
                      197.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: bgColor),
                      child: getAssetImage(subType[index].image!),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {
                            subtypesOfPlantScreenController
                                .onLikePosition(subType[index]);
                          },
                          child: subType[index].choice
                              ? getSvgImage("heart_fill.svg",
                                      height: 20.h, width: 20.h)
                                  .paddingOnly(right: 12.h, top: 12.h)
                              : getSvgImage("heart.svg",
                                      height: 20.h, width: 20.h)
                                  .paddingOnly(right: 12.h, top: 12.h)),
                    )
                  ],
                ),
                getVerSpace(8.h),
                getCustomFont(subType[index].name!, 16.sp, regularBlack, 1,
                    fontWeight: FontWeight.w700),
                getVerSpace(2.h),
                getCustomFont(subType[index].price!, 14.sp, regularBlack, 1,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
        );
      },
    );
  }
}
