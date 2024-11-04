import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plant_shoap_app/main_project.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';

import '../view/home/profile_screens/order_detail.dart';

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double horSpace) {
  return SizedBox(
    width: horSpace,
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
      decoration: decoration,
      fontSize: fontSize,
      color: fontColor,
      fontFamily: fontFamily,
      height: txtHeight ?? 1.5.h,
      fontWeight: fontWeight,
    ),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: 'Gilroy',
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget getCustomButton(String text, Function function,
    {double? buttonheight,
    double? buttonwidth,
    double? fontSize,
    FontWeight? weight,
    Color? color,
    BoxDecoration? decoration}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Container(
      height: buttonheight ?? 60,
      width: buttonwidth ?? double.infinity,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: buttonColor,
          ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize ?? 18.sp,
            color: color ?? Color(0XFFFFFFFF),
            fontFamily: 'Gilroy',
            fontWeight: weight ?? FontWeight.w700),
      )),
    ),
  );
}

Widget getLoginScreenAppbar(Function close, Function later) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
          onTap: () {
            close();
          },
          child: getAssetImage("appbarclosebutton.png",
              height: 24.h, width: 24.w)),
      GestureDetector(
          onTap: () {
            later();
          },
          child: getCustomFont("Later", 16.sp, Color(0XFF808080), 1,
              fontWeight: FontWeight.w500))
    ],
  );
}

Widget getTextField(String hinttext,
    {FontWeight? fontWeight,
    double? fontsize,
    Color? color,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    String? val,
    bool enable = false}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.h),
      boxShadow: [
        BoxShadow(
            offset: Offset(0, 4),
            color: regularBlack.withOpacity(0.03),
            blurRadius: 16),
      ],
    ),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      initialValue: val,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
            fontSize: fontsize ?? 16.sp,
            fontFamily: 'Gilroy',
            color: color ?? subTitleColor,
            fontWeight: fontWeight ?? FontWeight.w500),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFFDEDEDE), width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFF76974C), width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: enable
            ? OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.w),
                borderRadius: BorderRadius.circular(12),
              )
            : OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0XFFFFFFFF), width: 1.w),
                borderRadius: BorderRadius.circular(12),
              ),
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        contentPadding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 20.h),
      ),
      validator: validator,
    ),
  );
}

Widget getGoogleFacebookButton(String image, String text,
    {double? buttonheight,
    double? imageheight,
    double? imagewidth,
    double? width,
    FontWeight? fontweight,
    double? fontsize,
    Color? color}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: buttonheight ?? 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: AssetImage("${Constant.assetImagePath}${image}"),
              width: imagewidth ?? 24.w,
              height: imageheight ?? 24.h),
          getHorSpace(width ?? 14.w),
          getCustomFont(text, fontsize ?? 18.sp, color ?? Color(0XFF000000), 1,
              fontWeight: fontweight ?? FontWeight.w500)
        ],
      ),
    ),
  );
}

Widget getRichtext(String firsttext, String secondtext,
    {Function? function,
    Color? firsttextcolor,
    Color? secondtextcolor,
    double? firsttextSize,
    double? secondtextSize,
    FontWeight? firstTextwidth,
    FontWeight? secondTextwidth}) {
  return Center(
    child: RichText(
        text: TextSpan(
            text: firsttext,
            style: TextStyle(
                color: firsttextcolor ?? Color(0XFF000000),
                fontSize: firsttextSize ?? 15.sp,
                fontFamily: 'Gilroy',
                fontWeight: firstTextwidth ?? FontWeight.w500),
            children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                function!();
              },
            text: secondtext,
            style: TextStyle(
                color: secondtextcolor ?? Color(0XFF76974C),
                fontSize: firsttextSize ?? 15.sp,
                fontWeight: firstTextwidth ?? FontWeight.w700,
                fontFamily: 'Gilroy'),
          )
        ])),
  );
}

Widget getPhoneNumberField(Key key, TextEditingController controller,
    {Function? validationFunction}) {
  return Form(
    key: key,
    child: IntlPhoneField(
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Color(0XFF000000),
      ),
      flagsButtonPadding: EdgeInsets.only(left: 16.h),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFFDEDEDE), width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red, width: 1.w)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFF76974C), width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFFFFFFFF), width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {},
      validator: (val) {
        validationFunction!();
        return null;
      },
    ),
  );
}

Widget getAppBar(String text,
    {Function? function,
    Color? color,
    double? space,
    bool iconpermmition = true}) {
  return Container(

    color: color,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                function!();
              },
              child: iconpermmition
                  ? getSvgImage("arrow_square_left.svg",
                      height: 24.h, width: 24.w)
                  : SizedBox(width: 24,)),
        
          Expanded(
            child: getCustomFont(text, 22.sp, Color(0XFF000000), 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center),
          ),
          getHorSpace(24.w),
        ],
      ),
    ),
  );
}

Widget getOTPfield(Key key, {Function? function}) {
  return Form(
    key: key,
    child: OtpTextField(
      showFieldAsBox: true,
      numberOfFields: 6,
      borderRadius: BorderRadius.circular(12),
      borderWidth: 0,
      focusedBorderColor: Color(0XFF76974C),
      fieldWidth: 60.h,
      filled: true,
      fillColor: Color(0XFFFFFFFF),
      onSubmit: (value) {
        function!();
      },
    ),
  );
}

Widget getSearchField(String? text,
    {Function? function,
    Color? hinttextcolor,
    double? hinttextsize,
    FontWeight? fontweight,
    String? prefixiconimage,
    double? prefixiconimageheight,
    double? prefixiconimagewidth,
    double? suffixiconimageheight,
    double? suffixiconimagewidth,
    String? suffixiconimage,
    Function? suffixfunction}) {
  return TextFormField(
      onTap: () {
        function!();
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color(0XFF76974C), width: 1.w),
              borderRadius: BorderRadius.circular(22)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color(0XFFDCDCDC), width: 1.w),
              borderRadius: BorderRadius.circular(22)),
          filled: true,
          fillColor: Color(0XFFFFFFFF),
          hintText: text,
          hintStyle: TextStyle(
              color: hinttextcolor ?? subTitleColor,
              fontSize: hinttextsize ?? 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: fontweight ?? FontWeight.w400),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
                top: 16.h, left: 16.w, bottom: 16.h, right: 12.h),
            child: getSvgImage(
              "searchIcon.svg",
              height: prefixiconimageheight ?? 24.h,
              width: prefixiconimagewidth ?? 24.w,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              suffixfunction!();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, right: 16.w, bottom: 16.h),
              child: Container(
                height: suffixiconimageheight ?? 24.h,
                width: suffixiconimagewidth ?? 24.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "${Constant.assetImagePath}${suffixiconimage}"),
                  ),
                ),
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(22))));
}

Widget getTabBar(TabController tabcontroller, PageController pagecontroller,
    List<Widget> tabs) {
  return Container(
    height: 50.h,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.h),
        color: regularWhite,
        border: Border.all(color: Color(0XFFF1F1F1))),
    child: Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: TabBar(
        unselectedLabelColor: Color(0XFF808080),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 14.sp, fontFamily: 'Gilroy'),
        labelColor: regularWhite,
        dividerColor: Colors.transparent,
        unselectedLabelStyle: TextStyle(
            color: Color(0XFF808080),
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            fontFamily: 'Gilroy',
            height: 1.5.h),
        indicator: ShapeDecoration(
            color: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.h))),
        controller: tabcontroller,
        tabs: tabs,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: (value) {
          pagecontroller.animateToPage(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    ),
  );
}

Widget getPopularDataFormet(String image, Function function, bool initialvalue,
    String plantname, String plantprice,
    {double? imageContainerHeight,
    double? imageContainerWidth,
    double? iconheight,
    double? iconwidth,
    double? pricefontsize,
    FontWeight? pricefontweight,
    double? namefontsize,
    FontWeight? namefontweight,
    double? iconleftpad,
    double? icontoppad,
    double? imageandnamespace,
    double? nameandpricespace}) {
  return Column(
    //crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: imageContainerHeight ?? 114.h,
        width: imageContainerWidth ?? 111.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h),
            color: bgColor,
            image: DecorationImage(
                image: AssetImage("${Constant.assetImagePath}${image}"),
                fit: BoxFit.fill)),
      ),
      getVerSpace(imageandnamespace ?? 6.h),
      getCustomFont(plantname, namefontsize ?? 14.sp, Color(0XFF000000), 1,
          fontWeight: namefontweight ?? FontWeight.w600, txtHeight: 1.5.h),
      getVerSpace(nameandpricespace ?? 4.h),
      getCustomFont(
          "\$${plantprice}", pricefontsize ?? 14.sp, Color(0XFF000000), 1,
          fontWeight: pricefontweight ?? FontWeight.w500, txtHeight: 1.5.h),
    ],
  );
}

Widget atmospherRules(String image, String atmospherRulse, int percent) {
  return getCustomContainer(60.h, 148.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0XFFE8F0DE),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: getCustomContainer(40.h, 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: getAssetImage(image),
                )),
          ),
          getHorSpace(9.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCustomFont(atmospherRulse, 14.sp, regularBlack, 1,
                  fontWeight: FontWeight.w500),
              getCustomFont('${percent}%', 14.sp, buttonColor, 1,
                  fontWeight: FontWeight.w600),
            ],
          )
        ],
      ));
}

Widget getFilterCategory(String emptyList, String nameofList,
    {Function? function}) {
  return Wrap(
    alignment: WrapAlignment.start,
    children: [
      SizedBox(
        height: 60.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: emptyList.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8.h),
                  child: GestureDetector(
                    onTap: () {
                      function!();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 13),
                      decoration: BoxDecoration(
                        color: emptyList.contains(nameofList[index])
                            ? Color(0XFF76974C)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: emptyList.contains(nameofList[index])
                                ? Color(0XFF76974C)
                                : Color(0XFFDCDCDC),
                            width: 1),
                      ),
                      height: 40.h,
                      child: Center(
                        child: Text(
                          emptyList[index],
                          style: emptyList.contains(nameofList[index])
                              ? TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFFFFFFF),
                                  fontFamily: 'Gilroy')
                              : TextStyle(
                                  fontSize: 16.sp,
                                  color: Color(0XFF6E758A),
                                  fontFamily: 'Gilroy'),
                        ),
                      ),
                    ),
                  ),
                )),
      )
    ],
  );
}

Widget getCustomContainer(double? height, double? width,
    {BoxDecoration? decoration, Widget? child, Color? color}) {
  return Container(
    height: height,
    width: width,
    color: color,
    decoration: decoration,
    child: child,
  );
}

Widget getadd_remove_button(String? image,
    {Function? function,
    double? height,
    double? width,
    double? padding,
    Color? color}) {
  return GestureDetector(
    onTap: () {
      function!();
    },
    child: getCustomContainer(height ?? 34.h, width ?? 34.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color(0XFFF4F4F4)),
          color: color ?? Color(0XffFFFFFF),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 7.h),
          child: getSvgImage(image!, height: 18.h, width: 18.h),
        )),
  );
}

Widget getCartDetailFormate(String productImage, String productName,
    String productPrice, int productQuntity, String size,
    {double? veraround, Widget? column}) {
  return Stack(
    children: [
      Row(
        children: [
          getHorSpace(7.w),
          getCustomContainer(
            95.h,
            95.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.h),
                color: Color(0XFFEFEFEF)),
            child: getAssetImage(productImage, height: 75.h, width: 51.h)
                .paddingSymmetric(horizontal: 22.h),
          ),
          getHorSpace(20.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(productName, 18.sp, Color(0XFF000000), 1,
                  fontWeight: FontWeight.w600),
              getVerSpace(10.h),
              Row(
                children: [
                  getCustomFont("Size:", 14.sp, Color(0XFF808080), 1,
                      txtHeight: 1.5.h, fontWeight: FontWeight.w500),
                  getHorSpace(2.h),
                  getCustomFont(size, 14.sp, regularBlack, 1,
                      txtHeight: 1.5.h, fontWeight: FontWeight.w500),
                ],
              ),
              getVerSpace(8.h),
              getCustomFont("\$${productPrice}", 15.sp, Color(0XFF000000), 1,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 290.w, top: 14.h, bottom: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                      barrierDismissible: false,
                      title: '',
                      content: Padding(
                        padding: EdgeInsets.only(left: 10.h, right: 10.h),
                        child: Column(
                          children: [
                            getCustomFont(
                                "Are you sure you want to delete this plant from cart?",
                                18.sp,
                                Color(0XFF000000),
                                2,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center),
                            Padding(
                              padding: EdgeInsets.only(top: 25.h, bottom: 13.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: getCustomButton("No", () {
                                    Get.back();
                                  },
                                          color: Color(0XFF76974C),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF76974C),
                                              style: BorderStyle.solid,
                                              width: 1.0.w,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.h),
                                          ),
                                          buttonheight: 60.h)),
                                  getHorSpace(20.h),
                                  Expanded(
                                      child: getCustomButton("Yes", () {},
                                          buttonheight: 60.h)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                },
                child: getAssetImage("delete.png", height: 20.h, width: 20.w)),
            getVerSpace(32.h),
            Row(
              children: [
                getadd_remove_button("remove_icon.svg",
                    function: () {},
                    color: regularWhite,
                    padding: 5.h,
                    height: 28.h,
                    width: 28.w),
                getHorSpace(20.h),
                getCustomFont("${productQuntity}", 16, Color(0XFF000000), 1,
                    fontWeight: FontWeight.w500),
                getHorSpace(20.h),
                getadd_remove_button("add_icon.svg",
                    function: () {},
                    color: regularWhite,
                    padding: 5.h,
                    height: 28.h,
                    width: 28.w),
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Widget getCartOrderListFormate(String productImage, String productName,
    String size, int productPrice, int productQuntity,
    {double? veraround, Widget? column, double? quntitypadding}) {
  return Row(
    children: [
      getHorSpace(7.w),
      getCustomContainer(
        95.h,
        95.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h), color: bgColor),
        child: getAssetImage(
          productImage,
        ),
      ),
      getHorSpace(20.w),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCustomFont(productName, 18.sp, Color(0XFF000000), 1,
              fontWeight: FontWeight.w600),
          getVerSpace(10.h),
          Row(
            children: [
              getCustomFont("Size:", 14.sp, Color(0XFF808080), 1,
                  fontWeight: FontWeight.w500),
              getHorSpace(3.h),
              getCustomFont(size, 14.sp, regularBlack, 1,
                  fontWeight: FontWeight.w500),
            ],
          ),
          getVerSpace(10.h),
          getCustomFont("\$${productPrice}", 15.sp, Color(0XFF000000), 1,
              fontWeight: FontWeight.w500),
        ],
      ),
    ],
  );
}

Widget getSuccessConfirmMessegeFormate(String image, String messege,
    String successmessege, String buttonText, Function function,
    {BoxDecoration? Decoration, Color? textColor}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      getAssetImage(image, height: 140.h, width: 140.w),
      getVerSpace(30.h),
      getCustomFont(messege, 28, Color(0XFF000000), 2,
          fontWeight: FontWeight.w700),
      getVerSpace(8.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.h),
        child: getCustomFont(successmessege, 16, Color(0XFF000000), 2,
            fontWeight: FontWeight.w500, textAlign: TextAlign.center),
      ),
      getVerSpace(40.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 75.w),
        child: getCustomButton(buttonText, decoration: Decoration, () {
          function();
        }, color: textColor ?? Color(0XFFFFFFFF)),
      ),
    ],
  );
}

Widget getProfileOption(String image, String name, Function function,
    {double? height, double? width}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        height: 45.h,
        width: double.infinity,
        color: Color(0XFFFFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                getSvgImage(image,
                    height: height ?? 24.h, width: width ?? 24.h),
                getHorSpace(20.w),
                getCustomFont(name, 16.sp, Color(0XFF000000), 1,
                    fontWeight: FontWeight.w500)
              ],
            ),
            getSvgImage("arrow_right.svg", height: 20.h, width: 20.w)
          ],
        ),
      ),
    ),
  );
}

Widget getDivider({double? horPadding, Color? color}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horPadding ?? 20.w),
    child: Divider(
      color: color ?? Color(0XFFDCDCDC),
    ),
  );
}

Widget getMyprofileDetailFormate(
    String iconImage, String cetegoryName, String userDetail) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSvgImage(iconImage,
                height: 24.h, width: 24.w, color: buttonColor),
            getHorSpace(16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont(cetegoryName, 16.sp, Color(0XFF808080), 1,
                    fontWeight: FontWeight.w500),
                getVerSpace(7.h),
                getCustomFont(userDetail, 16.sp, regularBlack, 1,
                    fontWeight: FontWeight.w500)
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget getEditProfileOptionFormate(bool suffixIconPosition,
    {String? iconImage,
    double? height,
    int? maxline,
    bool requredImage = false,
    String? hint,
    String? userdetail}) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        height: height ?? 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.h),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 16,
                  color: regularBlack.withOpacity(0.03))
            ],
            color: regularWhite),
        child: TextFormField(
          maxLines: maxline ?? 1,
          initialValue: userdetail,
          decoration: InputDecoration(
              suffixIcon: suffixIconPosition
                  ? getSvgImage("arrow_down.svg", height: 16.h, width: 16.h)
                      .paddingOnly(top: 20.h, bottom: 20.h, right: 20.h)
                  : null,
              border: InputBorder.none,
              hintText: hint,
              contentPadding: suffixIconPosition
                  ? EdgeInsets.only(left: 18.h, top: 20.h)
                  : EdgeInsets.only(left: 18.h, top: 10.h)),
        ),
      ));
}

Widget getMyaddressFormate(
    String addressPlace, String address, String MobileNumber) {
  return getCustomContainer(142.h, double.infinity,
      color: regularWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: getAssetImage("addressLocation.png",
                  height: 34.h, width: 34.w),
            ),
            getHorSpace(20.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont(addressPlace, 15.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500),
                    getVerSpace(5.h),
                    getMultilineCustomFont(address, 16.sp, regularBlack,
                        fontWeight: FontWeight.w500, txtHeight: 1.5.h),
                    getVerSpace(5.h),
                    getMultilineCustomFont(
                      MobileNumber,
                      16.sp,
                      regularBlack,
                      fontWeight: FontWeight.w500,
                      txtHeight: 1.5.h,
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuButton(
                constraints: BoxConstraints(minHeight: 97.h, minWidth: 118.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.h)),
                child: getSvgImage("more_vert_rounded.svg",
                    height: 24.h, width: 24.w),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        value: 1,
                        child: GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                              onTap: () {
                              MainProject();
                              },
                              child: getCustomFont(
                                  "Edit", 16.sp, regularBlack, 1,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        value: 2,
                        child: GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: '',
                                      content: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Column(
                                          children: [
                                            getCustomFont(
                                                "Are you sure you want to delete this address?",
                                                textAlign: TextAlign.center,
                                                18.sp,
                                                Color(0XFF000000),
                                                10,
                                                fontWeight: FontWeight.w600),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 30.h, bottom: 10.h),
                                              child: Row(
                                                children: [
                                                  getCustomButton(
                                                    "No",
                                                    () {
                                                      Get.back();
                                                    },
                                                    color: Color(0XFF76974C),
                                                    buttonwidth: 135.w,
                                                    buttonheight: 56.h,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xFF76974C),
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1.0.w,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.h),
                                                    ),
                                                  ),
                                                  getHorSpace(15.w),
                                                  getCustomButton("Yes", () {},
                                                      buttonwidth: 135.w,
                                                      buttonheight: 56.h),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                                child: getCustomFont(
                                    "Delete", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ]).paddingOnly(top: 20.h),
          ],
        ),
      ));
}

Widget getActiveOrderFormet(String orderPosition, String productImage,
    String productName, String date, double productPrice, double productQuntity,
    {Function? function}) {
  return GestureDetector(
    onTap: () {
      Get.to(OrderDetailScreen());
    },
    child: getCustomContainer(133.h, double.infinity,
        color: regularWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Row(
              children: [
                getCustomContainer(95.h, 95.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: bgColor,
                    ),
                    child: getAssetImage(
                      "${productImage}",
                    ).paddingAll(5.h)),
                getHorSpace(20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCustomFont(productName, 18.sp, Color(0XFF000000), 10,
                        fontWeight: FontWeight.w600),
                    getVerSpace(6.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            getCustomFont(
                                "Size: ", 14.sp, Color(0XFF808080), 10,
                                fontWeight: FontWeight.w500),
                            getHorSpace(5.h),
                            getCustomFont("M", 14.sp, regularBlack, 10,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        getHorSpace(16.h),
                        Row(
                          children: [
                            getCustomFont(
                                "Quantity:", 14.sp, Color(0XFF808080), 10,
                                fontWeight: FontWeight.w500),
                            getHorSpace(5.h),
                            getCustomFont("1", 14.sp, regularBlack, 10,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                    getVerSpace(6.h),
                    getCustomFont(
                        "\$${productPrice}", 14.sp, Color(0XFF000000), 10,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),

            // getHorSpace(53.h),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCustomFont(date, 14.sp, Color(0XFF808080), 1,
                        fontWeight: FontWeight.w500),
                    getVerSpace(44.h),
                    if (orderPosition.toLowerCase() == 'pending') ...[
                      Container(
                        height: 34.h,
                        width: 81.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Color(0XFFFFF8EC),
                        ),
                        child: Center(
                            child: getCustomFont(
                                orderPosition, 16.sp, Color(0XFFE1A200), 1,
                                fontWeight: FontWeight.w700)),
                      )
                    ],
                    if (orderPosition.toLowerCase() == 'delivered') ...[
                      Container(
                        height: 34.h,
                        width: 91.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Color(0XFFEEFCF0),
                        ),
                        child: Center(
                            child: getCustomFont(
                                orderPosition, 16.sp, Color(0XFF04B155), 1,
                                fontWeight: FontWeight.w700)),
                      )
                    ],
                    if (orderPosition.toLowerCase() == 'cancelled') ...[
                      Container(
                        height: 34.h,
                        width: 96.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Color(0XFFFFF3F3),
                        ),
                        child: Center(
                            child: getCustomFont(
                                orderPosition, 16.sp, Color(0XFFFC0A15), 1,
                                fontWeight: FontWeight.w700)),
                      )
                    ]
                  ],
                ),
              ],
            ),
          ],
        )),
  );
}

Widget getSearchHistry(String histry) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getCustomFont(histry, 16.sp, Color(0XFF000000), 1,
            fontWeight: FontWeight.w500),
        GestureDetector(
            onTap: () {},
            child: getAssetImage("circular_close_icon.png",
                height: 24.h, width: 24.w))
      ],
    ),
  );
}

Widget getNotificationFormate(
    int notificationNumber, String messege, String time) {
  return Container(

    decoration: BoxDecoration(
      color: regularWhite,
      boxShadow: [
        BoxShadow(
            offset: Offset(0, 4),
            color: regularBlack.withOpacity(0.03),
            blurRadius: 16),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getSvgImage("notification_green.svg", height: 24.h, width: 24.h),
        getHorSpace(20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomFont(
                  "Notification ${notificationNumber}", 16.sp, regularBlack, 1,
                  fontWeight: FontWeight.w700),
              getVerSpace(10.h),
              getMultilineCustomFont(messege, 16.sp, regularBlack,
                  fontWeight: FontWeight.w500, txtHeight: 1.5.h),
            ],
          ),
        ),
        getCustomFont("${time} ago", 14.sp, subTitleColor, 1,
            fontWeight: FontWeight.w500),
      ],
    ).paddingSymmetric(horizontal: 20.h, vertical: 20.h),
  ).paddingSymmetric(vertical: 10.h);
}

Widget getViewCartButton(String text, String total, String buttonText,
    Function lastButtonFunction, Function buttonFunction) {
  return GestureDetector(
    onTap: () {
      buttonFunction();
    },
    child: Align(
      alignment: Alignment.bottomCenter,
      child: getCustomContainer(60.h, double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h), color: buttonColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  getSvgImage("cart_icon.svg"),
                  getHorSpace(8.h),
                  getCustomFont(text, 16.sp, regularWhite, 1,
                      fontWeight: FontWeight.w700),
                  getHorSpace(20.h),
                  getCustomFont("\$${total}", 16.sp, regularWhite, 1,
                      fontWeight: FontWeight.w400),
                ],
              ),
              GestureDetector(
                onTap: () {
                  lastButtonFunction();
                },
                child: Row(
                  children: [
                    getCustomFont(buttonText, 16.sp, regularWhite, 1,
                        fontWeight: FontWeight.w700),
                    getHorSpace(8.h),
                    getSvgImage("arrow_right_white.svg",
                        height: 18.h, width: 18.h)
                  ],
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20.h)),
    ).paddingOnly(left: 20.h, right: 20.h, bottom: 30.h),
  );
}
