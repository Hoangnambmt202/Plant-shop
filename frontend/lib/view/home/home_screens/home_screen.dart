import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_shoap_app/controller/controller.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/model/blog_data_model.dart';
import 'package:plant_shoap_app/model/popular_plant.dart';
import 'package:plant_shoap_app/utils/color_category.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import 'package:plant_shoap_app/utils/constantWidget.dart';
import 'package:plant_shoap_app/view/home/home_screens/popular_plant_grid.dart';
import 'package:plant_shoap_app/view/home/home_screens/serch_filter_sheet.dart';
import 'package:plant_shoap_app/view/home/profile_screens/notification%20_scrern.dart';
import 'package:plant_shoap_app/view/home/home_screens/plant_type_screen.dart';
import 'package:plant_shoap_app/view/home/home_screens/search_screen.dart';

import '../../../model/plant_product.dart';
import 'blogScreen.dart';
import 'blog_data_grid.dart';
import 'popularPlant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<PlantProduct> plantdata = Data.getPlantProductData();
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  List<PopularPlant> popularplantdata = Data.getPopularPlantData();
  List<Blog> blogData = Data.getBlogData();
  late TabController _tabController;
  late PageController _pController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _pController = PageController();
    super.initState();
  }

  List itemCtegoryClass = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (homeScreenController) => column());
  }

  Widget column() {
    return Scaffold(
        backgroundColor: regularWhite,
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Text('Hello World', style: TextStyle(fontSize: 32.0)),
        ));
  }
}
