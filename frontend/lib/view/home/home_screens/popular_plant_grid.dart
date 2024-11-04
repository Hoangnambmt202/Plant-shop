import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../datafile/model_data.dart';
import '../../../model/popular_plant.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constantWidget.dart';

class opulerPlantGrid extends StatefulWidget {
  const opulerPlantGrid({Key? key}) : super(key: key);

  @override
  State<opulerPlantGrid> createState() => _opulerPlantGridState();
}

class _opulerPlantGridState extends State<opulerPlantGrid> {
  List<PopularPlant> popularplantdata = Data.getPopularPlantData();

  Future<bool> _future = Future<bool>.delayed(
    Duration(milliseconds: 400),
    () {
      return true;
    },
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return populerGrid();
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.14),
            highlightColor: bgColor,
            direction: ShimmerDirection.ltr,
            child: populerGrid(),
          );
        }
      },
    );
  }

  Widget populerGrid() {
    return Container(
      height: 170.h,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          itemExtent: 130,
          shrinkWrap: true,
          primary: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: popularplantdata.length,
          itemBuilder: (context, index) => GestureDetector(

                child: Container(
                  height: 166.h,
                  width: 111.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    color: regularWhite,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 114.h,
                        width: 121.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.h),
                            color: bgColor),
                        child: getAssetImage(popularplantdata[index].image!)
                            .paddingOnly(top: 13.h, bottom: 13.h),
                      ),
                      getVerSpace(6.h),
                      getCustomFont(
                          popularplantdata[index].name!, 14.sp, regularBlack, 1,
                          fontWeight: FontWeight.w600, txtHeight: 1.5.h),
                      getVerSpace(4.h),
                      getCustomFont("\$${popularplantdata[index].price}", 14.sp,
                          regularBlack, 1,
                          fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                    ],
                  ),
                ).paddingSymmetric(horizontal: 10.h),
              )),
    );
  }
}
