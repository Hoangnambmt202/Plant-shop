import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../datafile/model_data.dart';
import '../../../model/blog_data_model.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constantWidget.dart';
import 'blog_detail_screen.dart';

class BlogDataGrid extends StatefulWidget {
  const BlogDataGrid({Key? key}) : super(key: key);

  @override
  State<BlogDataGrid> createState() => _BlogDataGridState();
}

class _BlogDataGridState extends State<BlogDataGrid> {
  List<Blog> blogData = Data.getBlogData();

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
          return BlogGrid();
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.14),
            highlightColor: bgColor,
            direction: ShimmerDirection.ltr,
            child: BlogGrid(),
          );
        }
      },
    );
  }

  Widget BlogGrid() {
    return Container(
      height: 188.h,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          scrollDirection: Axis.horizontal,
          itemCount: blogData.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(BlogDetailScreen(detail: blogData[index]));
                },
                child: Stack(
                  children: [
                    Container(
                      height: 165.h,
                      width: 296.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h)),
                      child: Hero(
                        tag: blogData[index].image!,
                        child: getAssetImage(blogData[index].image!,
                            boxFit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      height: 81.h,
                      width: 276.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: bgColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont(
                              blogData[index].question!, 16.sp, regularBlack, 1,
                              fontWeight: FontWeight.w700),
                          getVerSpace(4.h),
                          getCustomFont(
                              blogData[index].date!, 14.sp, regularBlack, 1,
                              fontWeight: FontWeight.w500)
                        ],
                      ).paddingSymmetric(horizontal: 14.h),
                    ).paddingOnly(top: 127.h, left: 10.h, right: 10.h)
                    // getAssetImage(blogData[index].image!,height: 165.h,width: double.infinity)
                  ],
                ).paddingSymmetric(horizontal: 10.h),
              )),
    ).paddingOnly(bottom: 20.h);
  }
}
