import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/model/search_data.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/view/home/home_screens/serch_filter_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());

  List<Search> searchData = Data.getSearchData();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    setStatusBarColor(Color(0XFFFFFFFF));
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFFFFFFFF),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        backgroundColor: Color(0XFFFFFFFF),
        body: SafeArea(
            child: GetBuilder<SearchScreenController>(
          init: SearchScreenController(),
          builder: (searchScreenController) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                getVerSpace(30.h),
                getSearchField("Search...",
                    fontweight: FontWeight.w500,
                    function: () {
                      //Get.to(SearchScreen());
                    },
                    prefixiconimage: "searchIcon.png",
                    suffixiconimage: "filterIcon.png",
                    suffixfunction: () {
                      showModalBottomSheet(
                          backgroundColor: regularWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.h),
                          ),
                          context: context,
                          builder: (context) => const FilterSheet());
                    }),
                getVerSpace(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomFont("Recent", 18, Color(0XFF000000), 1,
                        fontWeight: FontWeight.w700),
                    getCustomFont("Clear All", 14, Color(0XFF000000), 1,
                        fontWeight: FontWeight.w400),
                  ],
                ),
                getVerSpace(20.h),
                getDivider(horPadding: 0),
                getVerSpace(10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchData.length,
                    itemBuilder: (context, index) {
                      return getSearchHistry(searchData[index].searchIteam!);
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
