import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/utils/color_category.dart';

import '../../../controller/controller.dart';
import '../../../model/blog_data_model.dart';
import '../../../utils/constantWidget.dart';

class BlogDetailScreen extends StatefulWidget {
  const BlogDetailScreen({required this.detail, Key? key}) : super(key: key);
  final Blog detail;

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  BlogDetailScreenController blogDetailScreenController =
      Get.put(BlogDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: GetBuilder<BlogDetailScreenController>(
                    init: BlogDetailScreenController(),
                    builder: (blogDetailScreenController) => Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 318.h,
                        width: double.infinity,
                        child: Hero(
                          tag: widget.detail.image!,
                          child: getAssetImage(widget.detail.image!,
                              boxFit: BoxFit.cover),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: getSvgImage("arrow_square_left.svg",
                              height: 24.h, width: 24.h),
                        ),
                        GestureDetector(
                          onTap: () {
                            blogDetailScreenController
                                .onChangeSavePosition();
                          },
                          child: blogDetailScreenController.savePosition
                              ? getSvgImage("save_fill_icon_black.svg",
                                  height: 24.h, width: 24.h)
                              : getSvgImage("save_icon_black_border.svg",
                                  height: 24.h, width: 24.h),
                        )
                      ],
                    ).paddingOnly(top: 24.h, left: 20.h, right: 20.h),
                    Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                getVerSpace(20.h),
                                getCustomFont(
                                    "How to keep indoor plants?",
                                    20.sp,
                                    regularBlack,
                                    1,
                                    fontWeight: FontWeight.w700,
                                    txtHeight: 1.5.h),
                                getVerSpace(10.h),
                                getCustomFont("13 Sep, 2022", 14.sp,
                                    regularBlack, 1,
                                    fontWeight: FontWeight.w500,
                                    txtHeight: 1.5.h),
                                getVerSpace(24.h),
                                getMultilineCustomFont(
                                    "Plants are predominantly photosynthetic eukaryotes of the kingdom Plantae. Historically, the plant kingdom encompassed all living things that were not animals, and included algae and fungi; however, all current definitions of Plantae exclude the fungi and some algae, as well as the prokaryotes",
                                    16.sp,
                                    regularBlack,
                                    fontWeight: FontWeight.w500,
                                    txtHeight: 1.5.h),
                                getVerSpace(24.h),
                                getMultilineCustomFont(
                                    "Green plants obtain most of their energy from sunlight via photosynthesis by primary chloroplasts that are derived from endosymbiosis with cyanobacteria.",
                                    16.sp,
                                    regularBlack,
                                    fontWeight: FontWeight.w500,
                                    txtHeight: 1.5.h),
                                getVerSpace(24.h),
                                getAssetImage("blogDeatilImage2nd.png",
                                    height: 166.h,
                                    width: double.infinity),
                                getVerSpace(20.h),
                                getMultilineCustomFont(
                                    "Green plants provide a substantial proportion of the world's molecular oxygen, and are the basis of most of Earth's ecosystems.",
                                    16.sp,
                                    regularBlack,
                                    fontWeight: FontWeight.w500,
                                    txtHeight: 1.5.h),
                                getVerSpace(20.h),
                              ],
                            ).paddingSymmetric(horizontal: 20.h))
                        .paddingOnly(
                            top: 274.h,
                            left: 20.h,
                            right: 20.h,
                            bottom: 21.h),
                  ],
                ),
              ],
            ),
          ),
        ],
                    ),
                  ),
      ),
    );
  }
}
