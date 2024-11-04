import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/model/popular_plant.dart';
import 'package:plant_shoap_app/utils/constant.dart';
import '../../../controller/controller.dart';

class ActiveOrderScreen extends StatefulWidget {
  const ActiveOrderScreen({Key? key}) : super(key: key);

  @override
  State<ActiveOrderScreen> createState() => _ActiveOrderScreenState();
}

class _ActiveOrderScreenState extends State<ActiveOrderScreen> {
  List<PopularPlant> popularPlantData = Data.getPopularPlantData();

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: GetBuilder<MyOrderScreenController>(
          init: MyOrderScreenController(),
          builder: (myOrderScreenController) => Column(
            children: [],
          ),
        ));
  }
}
