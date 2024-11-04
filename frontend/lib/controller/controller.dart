import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:plant_shoap_app/datafile/model_data.dart';
import 'package:plant_shoap_app/model/address.dart';
import 'package:plant_shoap_app/model/plant_product.dart';
import 'package:plant_shoap_app/model/plant_sub_types_model.dart';
import 'package:plant_shoap_app/model/popular_plant.dart';

class OnboardingScreenController extends GetxController {
  int currentPage = 0;

  onPageChange(int initialPage) {
    currentPage = initialPage;
    update();
  }
}

class LoginEmptyStateController extends GetxController {
  bool remember = false;
  void onRememberPosition() {
    remember = !remember;
    update();
  }
}

class ForgetPaswordEmptyStateController extends GetxController {}

class ResetPaswordEmptyStateController extends GetxController {}

class SignUpEmptyStateController extends GetxController {
  bool remember = false;
  void onRememberPosition() {
    remember = !remember;
    update();
  }
}

class VerificationScareenController extends GetxController {}

class HomeMainScreenController extends GetxController {
  RxInt position = 0.obs;

  onChange(int value) {
    position.value = value;
    update();
  }
}

class SearchScreenController extends GetxController {}

class HomeScreenController extends GetxController
    with GetTickerProviderStateMixin {
  // late TabController tabController;
  // late PageController pController;
  List<PlantProduct> plantdata = Data.getPlantProductData();

  // @override
  // void onClose() {
  //   tabController.dispose();
  //   super.onClose();
  // }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   tabController = TabController(length: 4, vsync: this);
  //   pController = PageController();
  //   super.onInit();
  // }

  onLikeCHange(index) {
    if (plantdata[index].initialvalue == true) {
      plantdata[index].initialvalue = false;
      update();
    } else {
      plantdata[index].initialvalue = true;
      update();
    }
  }
}

class PopularPlantDataScreen extends GetxController {
  List<PopularPlant> popularPlantData = Data.getPopularPlantData();
  List<PlantProduct> plantData  = Data.getPlantProductData();
  List<PopularPlant> detailData = [];

  onLikePosition(PopularPlant e) {
    if (e.initialvalue == false) {
      e.initialvalue = true;
      update();
    } else {
      e.initialvalue = false;
      update();
    }
  }

  onSetDetail(PopularPlant e) {
    detailData = e as List<PopularPlant>;
  }

  void onLikeCHange(PlantProduct e) {
    if (e.initialvalue == false) {
      e.initialvalue = true;
      update();
    } else {
      e.initialvalue = false;
      update();
    }
  }
}

class FilterSheetController extends GetxController {
  var option = 0;
  List<String> sortBy = [
    "Popular",
    "Most Recent",
    "Price High",
    "iooio",
    "utui",
    "gutu",
  ];
  List<String> selectedSortby = [];



  void onSetFiltercetegory(String selectedSortby) {}

   onChageOptionValue(int index) {
    option=index;
    update();
   }
}

class PlantTypeScreenController extends GetxController  with GetTickerProviderStateMixin{
  RxInt index = 0.obs;
  late TabController tabController;
  late PageController pController;
  void onChange(int categoryIndex) {
    index = categoryIndex.obs;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    pController = PageController();
    super.onInit();
  }

}

class PlantDetailScreenController extends GetxController {
  int qu = 1;
  bool position = true;
  int currentPage = 0;
  int cheakPosition = 0;
  bool likePosition = false;
  onPageChange(int initialPage) {
    currentPage = initialPage;
    update();
  }

  void onQuntityIncrese(int quntity) {
    qu = quntity + qu;
    update();
  }

  void onQuntityDicrese(int quntity) {
    qu = quntity - 1;

    update();
  }

  onBackposition(bool pos) {
    position = pos;
    update();
  }

   onSetCheakPosition(value) {
     cheakPosition = value;
     update();
   }

  void onLikePosition() {
    likePosition = !likePosition;
    update();
  }
}

class SnackPlantDetailScreenController extends GetxController{

}
class OutdoorsPlantScreenController extends GetxController{}
class IndoorPlantScreenController extends GetxController{
  int selectionIndex = 0;
  void onSetIndex(int index) {
    selectionIndex = index;
    update();
  }
}

class SubtypesOfPlantScreenController extends GetxController{
   onLikePosition(PlantSubtype subType) {
     if(subType.choice ==true){
       subType.choice = false;
       update();
     }
     else{
       subType.choice=true;
       update();
     }
   }
}
class GardenScreenController extends GetxController{}

class MyCartScreenController extends GetxController {}

class CheckOutScreenController extends GetxController {}

class PaymentMethodScreenController extends GetxController {
  //final List<String> choice = ['0', '1', '2', '3'];
int cheakPosition = 0;
  String? select;

  void onClickPaymentRadioButton(value) {
    print(value);
    select = value;
    update();
  }
  onSetCheakPosition(value) {
    cheakPosition = value;
    update();
  }
}

class ProfileScreenController extends GetxController {}

class MyProfileScreenController extends GetxController {}

class MyAddressScreenController extends GetxController {
  bool pos = true;
   onAddposition(bool val) {
     pos = val;
     update();
   }
}

class MyOrderScreenController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late PageController pController;
  bool myOrder = true;

  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    pController = PageController();
    super.onInit();
  }

  void onMyorderBackposition(bool val) {
    myOrder = val;
    update();
  }
}

class MyCardScreenController extends GetxController {
  int? cheakPosition ;
  onSetCheakPosition(value) {
    cheakPosition = value;
    update();
  }
}
class CartController extends GetxController{
  bool checkShipping = false;
  List<ModelAddress> addressLists = Data.getAddress();
  int? addressIndex;

  void changeAddress() {
    checkShipping = !checkShipping;
    update();
  }

  addAddress(String country, String street, String city, String pincode,
      String phoneNumber) {
    addressLists.add(ModelAddress(country,street,city, pincode,phoneNumber));
    update();
  }

  void addressChange(int index) {
    addressIndex = index;
    update();
  }
}
class SettingScreenController extends GetxController {}


class AddressEditController extends GetxController {}

class BlogScreenController extends GetxController{}

class BlogDetailScreenController extends GetxController{
  bool savePosition = false;
  void onChangeSavePosition() {
    savePosition = !savePosition;
    update();
  }

}

class CoupanScreenController extends GetxController{
  int? selectcoupen;
  void onSelectCoupen(int index) {
    selectcoupen=index;
    update();
  }
}

class OrederDetailScreenController extends GetxController{

}
