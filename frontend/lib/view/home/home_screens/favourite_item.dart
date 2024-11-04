import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/main_project.dart';
import '../../../datafile/model_data.dart';
import '../../../model/popular_plant.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constantWidget.dart';


class FavouriteItemScreen extends StatefulWidget {
  const FavouriteItemScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteItemScreen> createState() => _FavouriteItemScreenState();
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
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
        child: Scaffold(body: column1st()),
      ),
    );
  }

  Widget column1st() {
    return GetBuilder<PopularPlantDataScreen>(
        init: PopularPlantDataScreen(),
        builder: (popularPlantData) => Column(
              children: [
                Container(
                    height: 73.h,
                    width: double.infinity,
                    color: regularWhite,
                    child:
                        getAppBar("Popular Plants", space: 89.h, function: () {
                      Get.back();
                    })),
                getVerSpace(20.h),
                Expanded(
                    child: Container(
                  color: regularWhite,
                  child: AnimationLimiter(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 20.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 235.h,
                          mainAxisSpacing: 20.h,
                          crossAxisSpacing: 10.h),
                      itemCount: popularPlant.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                      MainProject());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.h),
                                      color: regularWhite),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          getCustomContainer(
                                            180.h,
                                            197.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.h),
                                                color: bgColor),
                                            child: getAssetImage(
                                                    popularPlant[index].image!)
                                                .paddingOnly(
                                                    left: 26.h,
                                                    right: 24.h,
                                                    top: 15.h,
                                                    bottom: 14.h),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                popularPlantDataScreen
                                                    .onLikePosition(
                                                        popularPlant[index]);
                                              },
                                              child: popularPlant[index]
                                                      .initialvalue
                                                  ? getSvgImage(
                                                          "heart_fill.svg",
                                                          height: 20.h,
                                                          width: 20.h)
                                                      .paddingOnly(
                                                          left: 165.h,
                                                          top: 12.h)
                                                  : getSvgImage("heart.svg",
                                                          height: 20.h,
                                                          width: 20.h)
                                                      .paddingOnly(
                                                          left: 165.h,
                                                          top: 12.h))
                                        ],
                                      ),
                                      getVerSpace(8.h),
                                      getCustomFont(popularPlant[index].name!,
                                          16.sp, regularBlack, 1,
                                          fontWeight: FontWeight.w700),
                                      getVerSpace(2.h),
                                      getCustomFont(
                                          "\$${popularPlant[index].price}",
                                          14.sp,
                                          regularBlack,
                                          1,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ))
              ],
            ));
  }

  Widget column2nd() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getAssetImage("favorite_item_image.png", height: 140.h, width: 140.w),
        getVerSpace(30.h),
        getCustomFont("No Favourites Yet!", 28, Color(0XFF000000), 2,
            fontWeight: FontWeight.w700),
        getVerSpace(8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.h),
          child: getCustomFont("Explore more and shortlist some products.", 16,
              Color(0XFF000000), 2,
              fontWeight: FontWeight.w500, textAlign: TextAlign.center),
        ),
        getVerSpace(40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 75.w),
          child: getCustomButton(
              "Add Favourites",
              buttonwidth: 177.h,
              color: buttonColor,
              decoration: BoxDecoration(
                  border: Border.all(color: buttonColor),
                  borderRadius: BorderRadius.circular(16.h)),
              () {}),
        ),
      ],
    );
  }
}
