import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/model/popular_plant.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';

class PopularPlantScreen extends StatefulWidget {
  const PopularPlantScreen({Key? key}) : super(key: key);

  @override
  State<PopularPlantScreen> createState() => _PopularPlantScreenState();
}

class _PopularPlantScreenState extends State<PopularPlantScreen> {
  PopularPlantDataScreen popularPlantDataScreen =
      Get.put(PopularPlantDataScreen());
  List<PopularPlant> popularPlant = Data.getPopularPlantData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: SafeArea(
          child: Scaffold(
            body: GetBuilder<PopularPlantDataScreen>(
              init: PopularPlantDataScreen(),
              builder: (popularPlantData) => Column(
                children: [
                  Container(
                      height: 73.h,
                      width: double.infinity,
                      color: regularWhite,
                      child: getAppBar("Popular Plants", space: 89.h,
                          function: () {
                        Get.back();
                      })),
                  getVerSpace(20.h),
                  Expanded(
                      child: Container(
                    color: regularWhite,

                  ))
                ],
              ),
            ),
          ),
        ));
  }
/*Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: GetBuilder<PlantDetailScreenController>(
              init: PlantDetailScreenController(),
              builder: (plantdetailcontroller) => Column(
                children: [
                  getAppBar("Popular Plants", function: () {
                    Get.back();
                    setStatusBarColor(Color(0XFFE8F0DE));
                  }),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.8,
                          scrollDirection: Axis.vertical,
                          children: popularPlantData.map((e) {
                            return GestureDetector(
                              onTap: () {
                                plantdetailcontroller.onBackposition(false);
                                Get.to(PlantDetail(detail: e));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white),
                                child: getPopularDataFormet(e.image!, () {
                                  print("before============${e.initialvalue}");
                                  popularPlantDataScreen.onLikePosition(e);
                                  print("after============${e.initialvalue}");
                                }, e.initialvalue, e.name!, e.price.toString(),
                                    imageContainerHeight: 180.h,
                                    imageContainerWidth: 178.w,
                                    namefontsize: 16.sp,
                                    namefontweight: FontWeight.w700,
                                    pricefontsize: 16.sp,
                                    pricefontweight: FontWeight.w700,
                                    iconheight: 16.h,
                                    iconleftpad: 151.w,
                                    icontoppad: 10.h,
                                    iconwidth: 16.w,
                                    imageandnamespace: 12.h,
                                    nameandpricespace: 3.h),
                              ),
                            );
                          }).toList()),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }*/
}
