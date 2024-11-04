import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constant{
  static String assetImagePath = "asset/images/";
  static const String fontsFamily = "Gilroy";
  static const double defScreenWidth = 414;
  static const double defScreenHeight = 896;

  }

initializeScreenSize(BuildContext context,
    {double width = 414, double height = 896}) {
  ScreenUtil.init(context, designSize: Size(width, height), minTextAdapt: true);
}