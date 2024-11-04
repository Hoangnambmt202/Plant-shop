import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/model/payment_method_model.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';


class AddNewCards extends StatefulWidget {
  const AddNewCards({Key? key}) : super(key: key);

  @override
  State<AddNewCards> createState() => _AddNewCardsState();
}

class _AddNewCardsState extends State<AddNewCards> {
  bool select = false;
  List<Payment> paymentOption = Data.getPaymentData();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: regularWhite,
          body: SafeArea(
            child: GetBuilder<PaymentMethodScreenController>(
              init: PaymentMethodScreenController(),
              builder: (CheckOutScreenController) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(4.h),
                  getAppBar("Payment Methods", function: () {
                    Get.back();
                  }, space: 71.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: getCustomFont(
                        "Select the payment method you want to use",
                        16.sp,
                        Color(0XFF000000),
                        1,
                        fontWeight: FontWeight.w500),
                  ),
                  getVerSpace(10.h),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 10),
                          child: getCustomContainer(74.h, double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.h),
                                  color: Color(0XFFFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(-14, 8),
                                      color:
                                          Color(0XFF181414).withOpacity(0.08),
                                      blurRadius: 32,
                                    )
                                  ]),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        getAssetImage(
                                            paymentOption[index].image!,
                                            height: 34.h,
                                            width: 34.w),
                                        getHorSpace(20.w),
                                        getCustomFont(
                                            paymentOption[index].name!,
                                            16,
                                            Color(0XFF000000),
                                            1,
                                            fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                    PopupMenuButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.h)),
                                        child: getAssetImage(
                                            "more_vert_rounded.png",
                                            height: 24.h,
                                            width: 24.w),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry>[
                                              PopupMenuItem(
                                                value: 1,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: 'Gilroy',
                                                      color:
                                                          Color(0XFF000000),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 2,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                        title: '',
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "Are you sure you want to delete card!",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Gilroy',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0XFF000000),
                                                                  fontSize:
                                                                      24.sp,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: 30.h,
                                                                    bottom:
                                                                        10.h),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                        child:
                                                                            Container(
                                                                      height:
                                                                          56.h,
                                                                      width: double
                                                                          .infinity
                                                                          .w,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(22.h),
                                                                        color:
                                                                            const Color(0XFF23408F),
                                                                      ),
                                                                      child: Center(
                                                                          child: Text(
                                                                        "Yes",
                                                                        style: TextStyle(
                                                                            fontFamily: 'Gilroy',
                                                                            fontWeight: FontWeight.w700,
                                                                            color: const Color(0XFFFFFFFF),
                                                                            fontStyle: FontStyle.normal,
                                                                            fontSize: 18.sp),
                                                                      )),
                                                                    )),
                                                                    SizedBox(
                                                                        width:
                                                                            10.w),
                                                                    Expanded(
                                                                        child: Container(
                                                                            height: 56.h,
                                                                            width: double.infinity.w,
                                                                            decoration: BoxDecoration(
                                                                              border: Border.all(
                                                                                color: const Color(0xFF23408F),
                                                                                style: BorderStyle.solid,
                                                                                width: 1.0.w,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(22.h),
                                                                            ),
                                                                            child: Center(
                                                                                child: Text(
                                                                              "No",
                                                                              style: TextStyle(fontFamily: 'Gilroy', fontWeight: FontWeight.w700, color: Color(0xFF23408F), fontSize: 18.sp),
                                                                            ))))
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ));
                                                  },
                                                  child: Text('Delete',
                                                      style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontFamily: 'Gilroy',
                                                        color:
                                                            Color(0XFF000000),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                                ),
                                              ),
                                            ]),
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 56.h, top: 30.h, left: 20.w, right: 20.w),
                    child: getCustomButton("Confirm Payment", () {
                      //Get.to(OrderConfirm());
                    }),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
