import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/controller.dart';
import '../../../datafile/model_data.dart';
import '../../../model/blog_data_model.dart';
import '../../../utils/color_category.dart';
import '../../../utils/constantWidget.dart';
import 'blog_detail_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  BlogScreenController blogScreenController = Get.put(BlogScreenController());
  List<Blog> blogData = Data.getBlogData();

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
        child: SafeArea(
          child: Scaffold(
            backgroundColor: bgColor,
              body: GetBuilder<BlogScreenController>(
            init: BlogScreenController(),
            builder: (blogScreenController) => Column(
              children: [
                Container(
                    height: 73.h,
                    width: double.infinity,
                    color: bgColor,
                    child: getAppBar("Blog", space: 140.h, function: () {
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
                        return blogList();
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.14),
                          highlightColor: bgColor,
                          direction: ShimmerDirection.ltr,
                          child: blogList(),
                        );
                      }
                    },
                  ).paddingOnly(bottom: 20.h),
                ))
              ],
            ),
          )
              //blogList()
              /* FutureBuilder<bool>(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData) {
                  return  column();
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.14),
                    highlightColor: bgColor,
                    direction: ShimmerDirection.ltr,
                    child:  column(),
                  );
                }
              },
            )*/
              ),
        ));
  }

  Widget blogList() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        itemCount: blogData.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.to(BlogDetailScreen(detail: blogData[index]));
              },
              child: Stack(
                children: [
                  Container(
                    height: 165.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.h)),
                    child: Hero(
                        tag: blogData[index].image!,
                        child: getAssetImage(blogData[index].image!,
                            boxFit: BoxFit.fill)),
                  ),
                  Container(
                    height: 81.h,
                    width: double.infinity,
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
              ).paddingSymmetric(vertical: 10.h),
            ));
  }
}
