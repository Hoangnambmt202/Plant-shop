import 'package:plant_shoap_app/model/address.dart';
import 'package:plant_shoap_app/model/blog_data_model.dart';
import 'package:plant_shoap_app/model/filterSheet_data_model.dart';
import 'package:plant_shoap_app/model/indoor_plant_data_model.dart';
import 'package:plant_shoap_app/model/my_address_data.dart';
import 'package:plant_shoap_app/model/my_cart_data.dart';
import 'package:plant_shoap_app/model/my_order_data_model.dart';
import 'package:plant_shoap_app/model/onboarding_slider.dart';
import 'package:plant_shoap_app/model/plant_product.dart';
import 'package:plant_shoap_app/model/popular_plant.dart';
import 'package:plant_shoap_app/model/rate_types_modeol.dart';

import '../model/coupen_model.dart';
import '../model/notification_data.dart';
import '../model/payment_method_model.dart';
import '../model/plant_detail_image_slider_model.dart';
import '../model/plant_sub_types_model.dart';
import '../model/plant_type_category.dart';
import '../model/search_data.dart';

class Data {
  static List<Sliders> getSliderPages() {
    return [
      Sliders(
          image: 'onboarding1st.png',
          richTitle1st: 'We provide high quality',
          richTitle2nd: ' Plants ',
          richTitle3rd: '  for you'),
      Sliders(
          image: 'onboarding2nd.png',
          richTitle1st: 'Your',
          richTitle2nd: ' Satisfaction',
          richTitle3rd: ' is our number one priority'),
      Sliders(
          image: 'onboarding3rd.png',
          richTitle1st: 'Let’s shop your',
          richTitle2nd: ' Favourite',
          richTitle3rd: ' plants with us'),
    ];
  }

  static List<FilterData> getFilterData() {
    return [
      FilterData(cetegory: 'Popular', selection: false),
      FilterData(cetegory: 'Best Selling', selection: false),
      FilterData(cetegory: 'Lowest Price', selection: false),
      FilterData(cetegory: 'Highest Price', selection: false)
    ];
  }

  static List<PlantProduct> getPlantProductData() {
    return [
      PlantProduct(
          image: 'plantproduct1st.png',
          name: 'Snake Plant',
          price: 12.00,
          initialvalue: false,
          id: 1,
          detailImage: 'plantproduct1st.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          category: 'Indoor'),
      PlantProduct(
          image: 'plantproduct2nd.png',
          name: 'Snake Plant',
          price: 13.00,
          initialvalue: false,
          id: 2,
          detailImage: 'plantproduct2nd.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          category: 'Indoor'),
      PlantProduct(
          image: 'plantproduct1st.png',
          name: 'Snake Plant',
          price: 14.00,
          initialvalue: false,
          id: 3,
          detailImage: 'plantproduct1st.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          category: 'Indoor'),
      PlantProduct(
          image: 'plantproduct2nd.png',
          name: 'Snake Plant',
          price: 15.00,
          initialvalue: false,
          id: 4,
          detailImage: 'plantproduct2nd.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          category: 'Indoor')
    ];
  }

  static List<PopularPlant> getPopularPlantData() {
    return [
      PopularPlant(
        image: 'popularPlant1st.png',
        name: 'Cimmodo viv',
        price: 15.00,
        initialvalue: false,
        id: 1,
        detailImage: 'popularPlantwithoutback1st.png',
        quntity: 1,
        plantimages: [
          "popularPlantwithoutback1st.png",
          "detailImage2nd.png",
          "popularPlantwithoutback2nd.png",
          "detailImage4th.png"
        ],
      ),
      PopularPlant(
        image: 'popularPlant2nd.png',
        name: 'Aliquam id',
        price: 20.00,
        initialvalue: false,
        id: 2,
        detailImage: 'popularPlantwithoutback2nd.png',
        quntity: 1,
        plantimages: [
          "popularPlantwithoutback1st.png",
          "detailImage2nd.png",
          "popularPlantwithoutback2nd.png",
          "detailImage4th.png"
        ],
      ),
      PopularPlant(
        image: 'popularPlant3rd.png',
        name: 'Lectus arcu',
        price: 10.00,
        initialvalue: false,
        id: 3,
        detailImage: 'popularPlantwithoutback3rd.png',
        quntity: 1,
        plantimages: [
          "popularPlantwithoutback1st.png",
          "detailImage2nd.png",
          "popularPlantwithoutback2nd.png",
          "detailImage4th.png"
        ],
      ),
      PopularPlant(
        image: 'popularPlant4th.png',
        name: 'Sed felis ege',
        price: 15.00,
        initialvalue: false,
        id: 4,
        detailImage: 'popularPlantwithoutback4th.png',
        quntity: 1,
        plantimages: [
          "popularPlantwithoutback1st.png",
          "detailImage2nd.png",
          "popularPlantwithoutback2nd.png",
          "detailImage4th.png"
        ],
      ),
      PopularPlant(
        image: 'popularPlant5th.png',
        name: 'Et ligula',
        price: 28.00,
        initialvalue: false,
        id: 5,
        detailImage: 'popularPlantwithoutback5th.png',
        quntity: 1,
        plantimages: [
          "popularPlantwithoutback1st.png",
          "detailImage2nd.png",
          "popularPlantwithoutback2nd.png",
          "detailImage4th.png"
        ],
      ),
      PopularPlant(
        image: 'popularPlant6th.png',
        name: 'Scelerisque',
        price: 18.00,
        initialvalue: false,
        id: 6,
        detailImage: 'popularPlantwithoutback6th.png',
        quntity: 1,
        plantimages: [
          "popularPlantwithoutback1st.png",
          "detailImage2nd.png",
          "popularPlantwithoutback2nd.png",
          "detailImage4th.png"
        ],
      )
    ];
  }

  static List<MyOrderData> getMyOrderData() {
    return [
      MyOrderData(
          image: 'popularPlant1st.png',
          name: 'Cimmodo viv',
          price: 15.00,
          initialvalue: false,
          id: 1,
          detailImage: 'popularPlantwithoutback1st.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          date: '25-02-2022',
          orderPosition: 'Pending'),
      MyOrderData(
          image: 'popularPlant2nd.png',
          name: 'Aliquam id',
          price: 20.00,
          initialvalue: false,
          id: 2,
          detailImage: 'popularPlantwithoutback2nd.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          date: '25-02-2022',
          orderPosition: 'Delivered'),
      MyOrderData(
          image: 'popularPlant3rd.png',
          name: 'Lectus arcu',
          price: 10.00,
          initialvalue: false,
          id: 3,
          detailImage: 'popularPlantwithoutback3rd.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          date: '25-02-2022',
          orderPosition: 'Pending'),
      MyOrderData(
          image: 'popularPlant4th.png',
          name: 'Sed felis ege',
          price: 15.00,
          initialvalue: false,
          id: 4,
          detailImage: 'popularPlantwithoutback4th.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          date: '25-02-2022',
          orderPosition: 'Cancelled'),
      MyOrderData(
          image: 'popularPlant5th.png',
          name: 'Et ligula',
          price: 28.00,
          initialvalue: false,
          id: 5,
          detailImage: 'popularPlantwithoutback5th.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          date: '25-02-2022',
          orderPosition: 'Pending'),
      MyOrderData(
          image: 'popularPlant6th.png',
          name: 'Scelerisque',
          price: 18.00,
          initialvalue: false,
          id: 6,
          detailImage: 'popularPlantwithoutback6th.png',
          quntity: 1,
          plantimages: [
            "popularPlantwithoutback1st.png",
            "detailImage2nd.png",
            "popularPlantwithoutback2nd.png",
            "detailImage4th.png"
          ],
          date: '25-02-2022',
          orderPosition: 'Pending')
    ];
  }

  static List<Payment> getPaymentData() {
    return [
      Payment(name: 'Paypal', image: 'paypalpayment.png', type: 'card'),
      Payment(
          name: 'Cash On Delivery',
          image: 'cashondeliveryPayment.png',
          type: 'cash'),
      Payment(name: 'Stripe', image: 'stripe.png', type: 'swipe'),
    ];
  }

  static List<MyAddressDetail> getMyAddressData() {
    return [
      MyAddressDetail(
          addressPlace: 'Home',
          address: '4140 Parker Rd. Allentown, New Mexico 31134',
          mobileNumber: '(316) 555-0116'),
      MyAddressDetail(
          addressPlace: 'Office',
          address: '2464 Royal Ln. Mesa, New Jersey 45463',
          mobileNumber: '(505) 555-0125'),
      MyAddressDetail(
          addressPlace: 'Home',
          address: '3891 Ranchview Dr. Richardson, California 62639',
          mobileNumber: '(671) 555-0110'),
      MyAddressDetail(
          addressPlace: 'Office',
          address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
          mobileNumber: '(702) 555-0122'),
    ];
  }

  static List<Search> getSearchData() {
    return [
      Search(id: 1, searchIteam: 'Egestas fringilla'),
      Search(id: 2, searchIteam: 'Pulvinar sapien'),
      Search(id: 3, searchIteam: 'malesuada proin libero'),
      Search(id: 4, searchIteam: 'Pharetra magna ac'),
      Search(id: 5, searchIteam: 'Lacus luctus'),
    ];
  }

  static List<Blog> getBlogData() {
    return [
      Blog(
          image: 'blog1st.png',
          date: '13 Sep, 2022',
          question: 'How to keep indoor plants?'),
      Blog(
          image: 'blog2nd.png',
          date: '14 Sep, 2022',
          question: 'Should You Use Hard or Soft Water on Pl...'),
      Blog(
          image: 'blog3rd.png',
          date: '05 Sep, 2022',
          question: 'Signs that your plants may be struggling..'),
    ];
  }

  static List<PlantTypesCategory> getPlantTypesCategory() {
    return [
      PlantTypesCategory(categoryName: 'Outdoors', choice: false, id: 1),
      PlantTypesCategory(categoryName: 'Indoor', choice: false, id: 2),
      PlantTypesCategory(categoryName: 'Garden', choice: false, id: 3),
    ];
  }

  static List<IndoorPlant> getIndoorPlant() {
    return [
      IndoorPlant(name: 'Dragon Tree', image: 'indoor_plant_1st.png', id: 1),
      IndoorPlant(name: 'Island Pine', image: 'indoor_plant_2nd.png', id: 2),
      IndoorPlant(name: 'Fishtail Palm', image: 'indoor_plant_3rd.png', id: 3),
      IndoorPlant(name: 'European Olive', image: 'indoor_plant_4th.png', id: 4),
      IndoorPlant(name: 'Triangle Ficus', image: 'indoor_plant_5th.png', id: 5),
      IndoorPlant(name: 'Parlor Palm', image: 'indoor_plant_6th.png', id: 6),
    ];
  }

  static List<PlantSubtype> getPlantSubtype() {
    return [
      PlantSubtype(
          name: 'Olive tree',
          image: 'sub_type_plant1st.png',
          price: '\$15.00',
          choice: false,
          id: 1),
      PlantSubtype(
          name: 'Olea Europaea',
          image: 'sub_type_plant2nd.png',
          price: '\$15.00',
          choice: false,
          id: 2),
      PlantSubtype(
          name: 'Vickerman 60',
          image: 'sub_type_plant3rd.png',
          price: '\$15.00',
          choice: false,
          id: 3),
      PlantSubtype(
          name: 'Flora Bunda 28',
          image: 'sub_type_plant4th.png',
          price: '\$15.00',
          choice: false,
          id: 4),
      PlantSubtype(
          name: 'Faux Olive Tree',
          image: 'sub_type_plant5th.png',
          price: '\$15.00',
          choice: false,
          id: 5),
      PlantSubtype(
          name: 'Lavender Olive',
          image: 'sub_type_plant6th.png',
          price: '\$15.00',
          choice: false,
          id: 6),
    ];
  }

  static List<MyCartData> getMyCart() {
    return [
      MyCartData("popularPlant1st.png", "Cimmodo viv", 'M', '15', 1, 1),
      MyCartData("popularPlant2nd.png", 'Dignissim diam', 'M', '15', 1, 2),
      MyCartData("popularPlant3rd.png", 'Neque viverra', 'M', '15', 1, 3),
    ];
  }

  static List<DetailSliderImage> getSliderImage() {
    return [
      DetailSliderImage(image: 'popularPlantwithoutback1st.png'),
      DetailSliderImage(image: 'popularPlantwithoutback2nd.png'),
      DetailSliderImage(image: 'popularPlantwithoutback3rd.png'),
    ];
  }

  static List<RateType> getRateType() {
    return [
      RateType(rateName: 'Flat Rate', id: 1),
      RateType(rateName: 'Local Pickup', id: 2),
      RateType(rateName: 'Free Shipping', id: 3)
    ];
  }

  static List<Coupons> getCouponsData() {
    return [
      Coupons(
          discount: 10,
          discription: 'Most coupons have an expiration date, although',
          expireDate: '12 Mar, 2023',
          coupenCode: 'SHOPPING125'),
      Coupons(
          discount: 20,
          discription: 'Most coupons have an expiration date, although',
          expireDate: '10 Mar, 2023',
          coupenCode: 'BUY326'),
      Coupons(
          discount: 20,
          discription: 'Most coupons have an expiration date, although',
          expireDate: '10 Mar, 2023',
          coupenCode: 'NATURA10'),
    ];
  }

  static List<NotiFicationData> getNotiFicationData() {
    return [
      NotiFicationData(
          messege:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....',
          time: '2 h'),
      NotiFicationData(
          messege:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....',
          time: '3 h'),
      NotiFicationData(
          messege:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....',
          time: '6 h'),
      NotiFicationData(
          messege:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod....',
          time: '10 h'),
    ];
  }

  static List<ModelAddress> getAddress() {
    return [
      ModelAddress(
          'New Mexico', '4140 Parker Rd', 'Allentown', '31134', '1234567894'),
    ];
  }
}
