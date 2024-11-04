import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/model/rate_types_modeol.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrederDetailScreenController orederDetailScreenController =
      Get.put(OrederDetailScreenController());
  List<RateType> rateTypes = Data.getRateType();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: GetBuilder<OrederDetailScreenController>(
              init: OrederDetailScreenController(),
              builder: (orederDetailScreenController) => Column(
                children: [
                  Container(
                    color: regularWhite,
                    child: getAppBar("Order Details", function: () {
                      Get.back();
                    }),
                  ),
                  getVerSpace(20.h),
                  Expanded(
                      child: ListView(
                    children: [
                      getCustomContainer(
                        136.h,
                        double.infinity,
                        color: regularWhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomFont("Order ID : #576404", 16.sp,
                                    regularBlack, 1,
                                    fontWeight: FontWeight.w700),
                                getVerSpace(10.h),
                                Row(
                                  children: [
                                    getSvgImage("green_dot.svg",
                                        height: 10.h, width: 10.h),
                                    getHorSpace(8.h),
                                    getCustomFont(
                                        "Order at 6:35 PM | 4-March-2022",
                                        16.sp,
                                        regularBlack,
                                        1,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                                getVerSpace(9.h),
                                Row(
                                  children: [
                                    getCustomFont(
                                        "Status :", 17.sp, regularBlack, 1,
                                        fontWeight: FontWeight.w400),
                                    getHorSpace(7.sp),
                                    getCustomFont("Delivered", 16.sp,
                                        Color(0XFF04B155), 1,
                                        fontWeight: FontWeight.w700),
                                  ],
                                )
                              ],
                            ),
                            getCustomFont("\$15.00", 16.sp, regularBlack, 1,
                                fontWeight: FontWeight.w500)
                          ],
                        ).paddingSymmetric(horizontal: 20.h, vertical: 20.h),
                      ),
                      getVerSpace(20.h),
                      Container(
                        color: regularWhite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getVerSpace(20.h),
                            getCustomFont("Customer", 16.sp, regularBlack, 1,
                                fontWeight: FontWeight.w700),
                            getVerSpace(16.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    getAssetImage("profile.png",
                                        height: 55.h, width: 55.h),
                                    getHorSpace(14.h),
                                    getCustomFont("Jennie Winget", 16.sp,
                                        regularBlack, 1,
                                        fontWeight: FontWeight.w700)
                                  ],
                                ),
                                getSvgImage("call_icon_circuler.svg",
                                    height: 44.h, width: 44.h)
                              ],
                            ),
                            getVerSpace(22.h),
                            getCustomFont(
                                "Shipping Address :", 16.sp, subTitleColor, 1,
                                fontWeight: FontWeight.w500),
                            getVerSpace(8.h),
                            getMultilineCustomFont(
                                "4140 Parker Rd. Allentown, New Mexico 31134",
                                16.sp,
                                regularBlack,
                                fontWeight: FontWeight.w500,
                                txtHeight: 1.5.h),
                            getVerSpace(8.h),
                            getDivider(color: dividerColor, horPadding: 0),
                            getVerSpace(8.h),
                            getCustomFont(
                                "Billing Address :", 16.sp, subTitleColor, 1,
                                fontWeight: FontWeight.w500),
                            getVerSpace(8.h),
                            getMultilineCustomFont(
                                "4140 Parker Rd. Allentown, New Mexico 31134",
                                16.sp,
                                regularBlack,
                                fontWeight: FontWeight.w500,
                                txtHeight: 1.5.h),
                            getVerSpace(8.h),
                            getDivider(color: dividerColor, horPadding: 0),
                            getVerSpace(8.h),
                            getCustomFont(
                                "Order Note :", 16.sp, subTitleColor, 1,
                                fontWeight: FontWeight.w500),
                            getVerSpace(8.h),
                            getMultilineCustomFont(
                                "I need the best one", 16.sp, regularBlack,
                                fontWeight: FontWeight.w500,
                                txtHeight: 1.5.h),
                            getVerSpace(20.h),
                            GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: '',
                                      content: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Column(
                                          children: [
                                            getCustomFont(
                                                "Are you sure you want to delete this order?",
                                                textAlign: TextAlign.center,
                                                18.sp,
                                                regularBlack,
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
                                                          BorderRadius
                                                              .circular(16.h),
                                                    ),
                                                  ),
                                                  getHorSpace(15.w),
                                                  getCustomButton(
                                                      "Yes", () {},
                                                      buttonwidth: 135.w,
                                                      buttonheight: 56.h),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                                child: getCustomFont("Cancel Order", 16.sp,
                                    Color(0XFFFF3E3E), 1,
                                    fontWeight: FontWeight.w700)),
                            getVerSpace(20.h),
                          ],
                        ).paddingSymmetric(horizontal: 20.h),
                      ),
                      getVerSpace(20.h),
                      Container(
                        color: regularWhite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getCustomFont("Item : 1", 16.sp, regularBlack, 1,
                                fontWeight: FontWeight.w700),
                            getVerSpace(10.h),
                            Row(
                              children: [
                                getCustomContainer(95.h, 95.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: bgColor,
                                    ),
                                    child: getAssetImage(
                                      "popularPlantwithoutback1st.png",
                                    ).paddingAll(5.h)),
                                getHorSpace(20.w),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    getCustomFont("Cimmodo viv", 18.sp,
                                        regularBlack, 10,
                                        fontWeight: FontWeight.w600),
                                    getVerSpace(6.h),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            getCustomFont("Size: ", 14.sp,
                                                Color(0XFF808080), 10,
                                                fontWeight: FontWeight.w500),
                                            getHorSpace(5.h),
                                            getCustomFont(
                                                "M", 14.sp, regularBlack, 10,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                        getHorSpace(16.h),
                                        Row(
                                          children: [
                                            getCustomFont("Quantity:", 14.sp,
                                                Color(0XFF808080), 10,
                                                fontWeight: FontWeight.w500),
                                            getHorSpace(5.h),
                                            getCustomFont(
                                                "1", 14.sp, regularBlack, 10,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                      ],
                                    ),
                                    getVerSpace(6.h),
                                    getCustomFont("\$15.00", 14.sp,
                                        Color(0XFF000000), 10,
                                        fontWeight: FontWeight.w500),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 20.h, vertical: 20.h),
                      ),
                      getVerSpace(20.h),
                      Container(
                        color: regularWhite,
                        child: Column(
                          children: [
                            getVerSpace(20.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont(
                                    "Item Price", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                                getCustomFont(
                                    "\$41.00", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            getVerSpace(8.h),
                            getDivider(color: dividerColor, horPadding: 0),
                            getVerSpace(8.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont(
                                    "Shipping", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                                getCustomFont(
                                    "+\$3.00", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            getVerSpace(14.h),
                            GetBuilder<PlantDetailScreenController>(
                              init: PlantDetailScreenController(),
                              builder: (plantDetailScreenController) =>
                                  ListView.builder(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.h),
                                shrinkWrap: true,
                                primary: false,
                                physics: BouncingScrollPhysics(),
                                itemCount: rateTypes.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          plantDetailScreenController
                                              .onSetCheakPosition(index);
                                        },
                                        child: Row(
                                          children: [
                                            plantDetailScreenController
                                                        .cheakPosition ==
                                                    index
                                                ? getSvgImage(
                                                    "cheak_button_fill.svg")
                                                : getSvgImage(
                                                    "cheak_button.svg"),
                                            getHorSpace(8.h),
                                            index == 2
                                                ? Row(
                                                    children: [
                                                      getCustomFont(
                                                          rateTypes[index]
                                                              .rateName!,
                                                          16.sp,
                                                          regularBlack,
                                                          1,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500),
                                                      getRichtext(
                                                          " ( on order up to",
                                                          " \$20.00",
                                                          firsttextSize:
                                                              16.sp,
                                                          firsttextcolor:
                                                              Color(
                                                                  0XFF808080),
                                                          secondtextSize:
                                                              16.sp,
                                                          firstTextwidth:
                                                              FontWeight.w500,
                                                          secondTextwidth:
                                                              FontWeight.w500,
                                                          secondtextcolor:
                                                              buttonColor),
                                                      getCustomFont(
                                                        " )",
                                                        16.sp,
                                                        Color(0XFF808080),
                                                        1,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )
                                                    ],
                                                  )
                                                : getCustomFont(
                                                    rateTypes[index]
                                                        .rateName!,
                                                    16.sp,
                                                    regularBlack,
                                                    1,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ],
                                        ).paddingSymmetric(vertical: 6.h),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            getDivider(color: dividerColor, horPadding: 0),
                            getVerSpace(8.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont("Tax", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                                getCustomFont(
                                    "+\$2.00", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            getVerSpace(8.h),
                            getDivider(color: dividerColor, horPadding: 0),
                            getVerSpace(8.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont(
                                    "Discount", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                                getCustomFont(
                                    "-\$4.50", 16.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                            getVerSpace(8.h),
                            getDivider(color: dividerColor, horPadding: 0),
                            getVerSpace(8.h),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont("Total", 18.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w600),
                                getCustomFont(
                                    "\$60.50", 18.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                            getVerSpace(17.h),
                          ],
                        ).paddingSymmetric(horizontal: 20.h),
                      )
                    ],
                  ))
                ],
              ).paddingOnly(bottom: 30.h),
            ),
          )),
    );
  }
}
